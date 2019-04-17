use Mix.Config

config :two_repos, TwoRepos.BestOfRepos.Repo,
  database: "two_repos_demo",
  username: "best",
  password: "...",
  hostname: "localhost"

config :two_repos, TwoRepos.WorstOfRepos.Repo,
  database: "two_repos_demo",
  username: "worst",
  password: "...",
  hostname: "localhost"