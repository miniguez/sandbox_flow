defmodule App.MixProject do
  use Mix.Project

  def project do
    [
      app: :app,
      version: "0.1.0",
      elixir: "~> 1.15",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {App.Application, []},
      ecto_repos: [App.Repo]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ecto_sql, "~> 3.10"},
      {:postgrex, "~> 0.17.1"}, # Driver para PostgreSQL
      {:nimble_csv, "~> 1.2"},  # Para procesar CSV
      {:csv, "~> 2.4"},
      {:flow, "~> 1.2"}
    ]
  end
end
