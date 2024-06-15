defmodule EdgeDevice.Router do
  use Plug.Router

  plug(:match)
  plug(:dispatch)

  post "/data" do
    {:ok, body, _conn} = Plug.Conn.read_body(conn)
    IO.puts("Received data: #{body}")

    case :gen_tcp.connect(~c"cloud_service", 8080, [:binary, packet: :raw, active: false]) do
      {:ok, socket} ->
        :gen_tcp.send(socket, body)
        :gen_tcp.close(socket)

      {:error, reason} ->
        IO.puts("Failed to connect to cloud: #{reason}")
    end

    send_resp(conn, 200, "Data received")
  end

  match _ do
    send_resp(conn, 404, "Not Found")
  end
end

defmodule EdgeDevice.Application do
  use Application

  def start(_type, _args) do
    children = [
      {Plug.Cowboy, scheme: :http, plug: EdgeDevice.Router, options: [port: 8080]}
    ]

    opts = [strategy: :one_for_one, name: EdgeDevice.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
