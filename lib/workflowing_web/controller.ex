defmodule WorkflowingWeb.Controller do
  @moduledoc """
  Utility functions for generating HTTP responses compatible with Plug.
  """

  import Plug.Conn,
    only: [
      put_resp_content_type: 2,
      send_resp: 3
    ]

  alias WorkflowingWeb.HttpError

  @doc false
  def http_error(error_name, details \\ %{})

  def http_error(:bad_request, _) do
    %HttpError{
      status: 400,
      code: "BAD_REQUEST",
      message: "The request is either invalid or malformed.",
      details: %{}
    }
  end

  def http_error(:not_found, %{} = details) do
    %HttpError{
      status: 404,
      code: "NOT_FOUND",
      message: "The requested resource couldn't be found.",
      details: details
    }
  end

  @doc false
  def send_resp_json(%HttpError{} = error, conn) do
    put_resp_content_type(conn, "application/json")
    |> send_resp(error.status, Jason.encode!(error))
  end

  def send_resp_json(conn, status, payload) do
    put_resp_content_type(conn, "application/json")
    |> send_resp(status, Jason.encode!(payload))
  end
end
