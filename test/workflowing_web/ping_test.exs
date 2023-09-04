defmodule WorkflowingWeb.PingTest do
  use WebCase, async: true

  describe "GET /ping" do
    test ":: 200 :: pong!" do
      conn = conn(:get, "/ping") |> send_req()

      assert conn.state == :sent
      assert conn.status == 200
      assert conn.resp_body == "pong!"
    end
  end
end
