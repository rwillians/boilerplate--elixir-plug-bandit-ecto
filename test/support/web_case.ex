defmodule WebCase do
  use ExUnit.CaseTemplate

  import Plug.Conn

  using do
    quote do
      use Plug.Test

      import Ecto.Query
      import unquote(__MODULE__)

      alias Workflowing.Repo
    end
  end

  setup tags do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Workflowing.Repo)

    unless tags[:async] do
      Ecto.Adapters.SQL.Sandbox.mode(Workflowing.Repo, {:shared, self()})
    end

    :ok
  end

  @doc """
  Sends a request to WorkflowingWeb.Endpoint and receive a parsed response
  body when the reponse's content type is "application/json".
  """
  @spec send_req(Plug.Conn.t()) :: Plug.Conn.t()

  @conn_opts WorkflowingWeb.Endpoint.init([])

  def send_req(conn) do
    conn = WorkflowingWeb.Endpoint.call(conn, @conn_opts)

    case get_resp_header(conn, "content-type") do
      ["application/json" <> _] ->
        %{conn | body_params: Jason.decode!(conn.resp_body)}
        #        ^ hacky yea!

      _ ->
        conn
    end
  end

  def drop_id(acc \\ [], value)
  def drop_id(_acc, %{} = map), do: Map.drop(map, ["id"])
  def drop_id(acc, [head | tail]), do: [drop_id(head) | acc] |> drop_id(tail)
  def drop_id(acc, []), do: :lists.reverse(acc)
end
