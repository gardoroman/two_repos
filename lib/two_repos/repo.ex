defmodule RepoOne.Repo do
    use Ecto.Repo,
      otp_app: :two_repos,
      adapter: Ecto.Adapters.Postgres
  end
  