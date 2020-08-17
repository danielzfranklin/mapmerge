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
    "http://www.lib.utexas.edu/maps/historical/newark_nj_1922.jpg"
  end
end
