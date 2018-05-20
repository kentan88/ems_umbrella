use Mix.Config

config :ems, ecto_repos: [EMS.Repo]

import_config "#{Mix.env()}.exs"
