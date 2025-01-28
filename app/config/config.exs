import Config

config :app, App.Repo,
  database: "postgres",
  username: "postgres",
  password: "kVP7JGZKBmeWTU5B",
  hostname: "localhost",
  pool_size: 10

config :app,
  ecto_repos: [App.Repo]
