defmodule Mapmerge.Merge do
  def create(path, filename) do
    {:ok, %{id: 42, suggested_name: filename, suggested_position: {40.712216, -74.22655}}}
  end

  def get(id) do
    {:ok, %{id: 42, suggested_name: "foo", suggested_position: {40.712216, -74.22655}}}
  end
end
