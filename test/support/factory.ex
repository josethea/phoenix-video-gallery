defmodule Phoenixvideogallery.Factory do
    use ExMachina.Ecto, repo: Phoenixvideogallery.Repo

    def user_factory do
        %Phoenixvideogallery.User {
            token: "fdsadfsdfasfasdfasf",
            email: "example@example.com",
            first_name: "Juan",
            last_name: "Perez",
            provider: "google"
        }
    end
end