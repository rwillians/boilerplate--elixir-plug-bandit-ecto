##
#
#   COMPILE-TIME CONFIGURATIONS FOR "test" ENVIRONMENT
#   =================================================
#
#   For default compile-time configurations, please defer to the file
#   "config.exs".
#
##

import Config

#
#   LOGGER
#

config :logger,
  level: :warning,
  truncate: :infinity

#
#   ECTO
#

database_url =
  System.get_env("DATABASE_URL_TEST") ||
    "postgres://postgres:postgres@localhost:5432/workflowing_test"

config :workflowing, Workflowing.Repo,
  url: database_url,
  pool: Ecto.Adapters.SQL.Sandbox,
  force_drop: true
