defmodule MinimalWebsite.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      {Plug.Cowboy,
      scheme: :http,
      plug: SimpleAppRouter,
      options: [port: (System.get_env("PORT") || "8080") |> String.to_integer()]
    }    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: MinimalWebsite.Supervisor]
    Supervisor.start_link(children, opts)
  end
end