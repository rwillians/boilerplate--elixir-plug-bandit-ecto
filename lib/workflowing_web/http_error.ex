defmodule WorkflowingWeb.HttpError do
  @moduledoc """
  A standard HTTP error struct.
  """

  alias __MODULE__, as: HttpError

  @typedoc """
  The standard struct for HTTP errors.
  """
  @type t :: %HttpError{
          status: 400..599,
          code: String.t(),
          message: String.t(),
          details: map
        }

  @derive {Jason.Encoder, only: [:code, :message, :details]}
  defstruct [:status, :code, :message, details: %{}]
end
