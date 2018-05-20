use Mix.Config

# Configure your database
config :ems, EMS.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "ddd_dev",
  hostname: "localhost",
  pool_size: 10
