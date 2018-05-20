use Mix.Config

# Configure your database
config :ems, EMS.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "ems_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
