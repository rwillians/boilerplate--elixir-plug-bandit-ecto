##
#
#   RUNTIME CONFIGURATIONS (ALL ENVIRONMENTS)
#   =========================================
#
#   This file contas configurations that will be applied when the application
#   boots. Note that these configurations will be aplied after the code has
#   been compile, therefore, if you need to use a given configuration during
#   compile-time please defer to "config.exs".
#
##

import Config
import Ex.Config

#
#   ECTO
#

if is_remote?(config_env()) do
  database_url =
    env("DATABASE_URL") ||
      raise """
      missing "DATABASE_URL" environment variable!
      """

  maybe_ipv6 =
    if flag_enabled?("ECTO_IPV6", false),
      do: [:inet6],
      else: []

  pool_size =
    env("POOL_SIZE", "20")
    |> String.to_integer(10)

  config :workflowing, Workflowing.Repo,
    url: database_url,
    pool_size: pool_size,
    socket_options: maybe_ipv6,
    ssl: flag_enabled?("DATABASE_SSL_ENABLED", true)
end

#
#   ENDPOINT
#

case config_env() do
  :dev ->
    config :workflowing, WorkflowingWeb.Endpoint,
      port: env("PORT", "3000") |> String.to_integer(10),
      run_server?: flag_enabled?("SERVER_ENABLED", true)

  _ ->
    config :workflowing, WorkflowingWeb.Endpoint,
      port: env("PORT", "3000") |> String.to_integer(10),
      run_server?: flag_enabled?("SERVER_ENABLED", false)
end
