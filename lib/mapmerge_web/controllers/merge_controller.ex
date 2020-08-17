defmodule MapmergeWeb.MergeController do
  use MapmergeWeb, :controller
  alias Mapmerge.Merge

  def upload(conn, _params) do
    render(conn, "upload.html")
  end

  def handle_upload(conn, %{"upload" => %{"image" => %{filename: filename, path: path}}}) do
    {:ok, %{id: id}} = Merge.create(path, filename)
    redirect(conn, to: Routes.merge_path(conn, :position, id))
  end

  def position(conn, %{"id" => id}) do
    {:ok, merge} = Merge.get(id)

    render(conn, "position.html",
      id: id,
      image_url: image_url_for(merge.id),
      map_center: merge.map_center,
      map_zoom: merge.map_zoom,
      overlay_north_west: merge.overlay_north_west,
      overlay_south_east: merge.overlay_south_east,
      mapbox_token: Application.get_env(:mapmerge, :mapbox)[:token]
    )
  end

  def image_url_for(id) do
    "/images/example_image.jpg"
  end

  def handle_position(conn, %{
        "id" => id,
        "position" => %{
          "map_center" => map_center,
          "map_zoom" => map_zoom,
          "overlay_north_west" => overlay_north_west,
          "overlay_south_east" => overlay_south_east
        }
      }) do
    :ok =
      Merge.set_position(id, %{
        map_center: deserialize_position(map_center),
        map_zoom: deserialize_map_zoom(map_zoom),
        overlay_north_west: deserialize_position(overlay_north_west),
        overlay_south_east: deserialize_position(overlay_south_east)
      })

    redirect(conn, to: Routes.merge_path(Endpoint, :trace, id))
  end

  defp deserialize_map_zoom(string), do: String.to_integer(string)

  defp deserialize_position(string) do
    {:ok, [lat, lng]} = Jason.decode(string)
    {lat, lng}
  end
end
