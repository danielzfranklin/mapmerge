defmodule Mapmerge.Merge do
  def create(path, filename) do
    {:ok,
     %{
       id: 42,
       name: filename,
       map_center: {40.712216, -74.22655},
       map_zoom: 12,
       overlay_north_west: {40.712216, -74.22655},
       overlay_south_east: {40.773941, -74.12544}
     }}
  end

  def get(id) do
    {:ok,
     %{
       id: 42,
       name: "foo",
       map_center: {40.712216, -74.22655},
       map_zoom: 12,
       overlay_north_west: {40.712216, -74.22655},
       overlay_south_east: {40.773941, -74.12544}
     }}
  end
end
