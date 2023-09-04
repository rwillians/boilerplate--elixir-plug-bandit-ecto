##
#
#   DEFAULT COMPILE-TIME CONFIGURATIONS
#   ===================================
#
#   These configurations might be extended or overwritten in the
#   "dev.exs", "test.exs" and "remote.exs" configuration files,
#   which will be automatically loaded depending on the `MIX_ENV`
#   environment variable.
#
#   For runtime configurations (any environment), please defer to
#   the "runtime.exs" configuration file.
#
##

import Config

#
# LOGGER
#

config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id],
  backends: [:console]

#
# ECTO
#

config :workflowing, ecto_repos: [Workflowing.Repo]

#
# ENDPOINT
#

config :workflowing, WorkflowingWeb.Endpoint, run_server?: true

#
# ENVIRONMENT SPECIFIC COMPILED-TIME CONFIGURATIONS
#

case config_env() do
  :dev  -> import_config("dev.exs")
  :doc  -> import_config("test.exs")
  :test -> import_config("test.exs")
  _     -> import_config("remote.exs")
end
