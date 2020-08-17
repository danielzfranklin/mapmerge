defmodule MapmergeWeb.MergeView do
  use MapmergeWeb, :view

  def serialize_position({lat, lng}) do
    ~E"[<%= lat %>, <%= lng %>]"
  end

  def serialize_position_to_mapbox_object({lat, lng}) do
    ~E"L.latLng(<%= lat %>, <%= lng %>)"
  end
end
