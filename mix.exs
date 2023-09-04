defmodule Workflowing.MixProject do
  use Mix.Project

  def project do
    [
      app: :workflowing,
      version: "0.1.0",
      elixir: "~> 1.15",
      elixirc_paths: elixirc_paths(Mix.env()),
      elixirc_options: [debug_info: Mix.env() == :dev],
      build_embedded: Mix.env() not in [:dev, :test],
      start_permanent: Mix.env() not in [:dev, :test],
      aliases: aliases(),
      deps: deps()
    ]
  end

  defp aliases do
    [
      "ecto.setup": ["ecto.create --quiet", "ecto.migrate --quiet"]
    ]
  end

  def application do
    [
      mod: {Workflowing, []},
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:bandit, "~> 0.7.7"},
      {:corsica, "~> 2.1.2"},
      {:ecto, "~> 3.10.3"},
      {:ecto_sql, "~> 3.10.2"},
      {:etag_plug, "~> 1.0.0"},
      {:jason, "~> 1.4.1"},
      {:plug, "~> 1.14.2"},
      {:postgrex, ">= 0.17.3"},
      {:tapex, github: "rwillians/tapex", ref: "46900d4", only: :test}
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]
end
