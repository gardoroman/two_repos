use Mix.Config

config :two_repos, RepoOne.Repo,
  database: "two_repos_dev",
  username: "user_one",
  password: "...",
  hostname: "localhost"