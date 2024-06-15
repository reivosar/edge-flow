defmodule EdgeDevice.MixProject do
  use Mix.Project

  def project do
    [
      app: :edge_device,
      version: "0.1.0",
      elixir: "~> 1.11",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger, :cowboy, :plug_cowboy],
      mod: {EdgeDevice.Application, []}
    ]
  end

  defp deps do
    [
      {:plug_cowboy, "~> 2.0"}
    ]
  end
end
