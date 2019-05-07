# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
use Mix.Config

config :two_repos, env: Mix.env()


config :two_repos, ecto_repos: [TwoRepos.BestOfRepos.Repo]

import_config("dev.exs")
