FROM elixir:latest

WORKDIR /app

COPY mix.exs ./

RUN mix do deps.get, deps.compile

COPY . .

CMD ["mix", "run", "--no-halt"]
