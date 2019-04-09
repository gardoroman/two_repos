defmodule TwoRepos.MixProject do
  use Mix.Project

  def project do
    [
      app: :two_repos,
      version: "0.1.0",
      elixir: "~> 1.8",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger, :ecto_sql, :postgrex],
      mod: {TwoRepos.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ecto_sql, "~> 3.0.5"},
      {:postgrex, ">= 0.14.0"}
    ]
  end
end
