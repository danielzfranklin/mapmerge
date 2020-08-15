defmodule MapmergeWeb.HomeController do
  use MapmergeWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
