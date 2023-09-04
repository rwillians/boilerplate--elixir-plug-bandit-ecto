defmodule Workflowing.Repo do
  use Ecto.Repo,
    otp_app: :workflowing,
    adapter: Ecto.Adapters.Postgres
end
