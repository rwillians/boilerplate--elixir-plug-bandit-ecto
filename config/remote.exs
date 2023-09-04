##
#
#   COMPILE-TIME CONFIGURATIONS FOR ANY REMOTE ENVIRONMENT
#   ======================================================
#
#   Any non-local environment (such as "dev", "test" and "docs") is considered
#   a remote environment.
#
#   For default compile-time configurations, please defer to the file
#   "config.exs".
#
##

import Config

#
#   LOGGER
#

config :logger, level: :warning
config :logger, compile_time_purge_matching: [[level_lower_than: :warning]]
