defmodule Workflowing do
  @moduledoc false

  use Application

  def start(_normal, opts) do
    children =
      List.flatten([
        # ^ slightly hacky...
        Workflowing.Repo,
        WorkflowingWeb.Endpoint.children_spec(opts)
        #                       ^ ...because I don't want the endpoint to spin
        #                         up a server for "test" and "docs" environments.
      ])

    Supervisor.start_link(children, strategy: :one_for_one, id: Workflowing.Supervisor)
  end

  #
end
