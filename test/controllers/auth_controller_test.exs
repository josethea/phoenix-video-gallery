defmodule Phoenixvideogallery.AuthControllerTest do
    use Phoenixvideogallery.ConnCase
    alias Phoenixvideogallery.Repo
    alias Phoenixvideogallery.User

    @ueberauth_auth %{credentials: %{token: "fdsadfsdfasfasdfasf"}, info: %{email: "example@example.com", first_name: "Juan", last_name: "Perez"}, provider: :google}

    test "redirects user to Google for authentication", %{conn: conn} do
        conn = get conn, "/auth/google?scope=email%20profile"
        assert redirected_to(conn, 302)
    end

    test "creates user from Google information", %{conn: conn} do
        conn = conn
        |> assign(:ueberauth_auth, @ueberauth_auth)
        |> get("/auth/google/callback")

        users = User |> Repo.all
        assert Enum.count(users) == 1
        assert get_flash(conn, :info) == "Thank you for signing in!"
    end
end