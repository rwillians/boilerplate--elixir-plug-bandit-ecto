##
#
#   COMPILE-TIME CONFIGURATIONS FOR "dev" ENVIRONMENT
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
  level: :info,
  truncate: :infinity

#
#   ECTO
#

database_url =
  System.get_env("DATABASE_URL_DEV") ||
    "postgres://postgres:postgres@localhost:5432/workflowing_dev"

config :workflowing, Workflowing.Repo,
  url: database_url,
  force_drop: true
