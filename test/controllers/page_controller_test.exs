defmodule Phoenixvideogallery.PageControllerTest do
  use Phoenixvideogallery.ConnCase

  test "GET /", %{conn: conn} do
    conn = get conn, "/"
    assert html_response(conn, 200) =~ "Welcome to Video Gallery!"
  end
end
