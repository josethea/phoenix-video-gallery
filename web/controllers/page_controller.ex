defmodule Phoenixvideogallery.PageController do
  use Phoenixvideogallery.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
