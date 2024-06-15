FROM erlang:latest

WORKDIR /app

COPY src/cloud_app.erl /app/
RUN erlc cloud_app.erl

CMD ["erl", "-noshell", "-s", "cloud_app", "start", "-s", "init", "stop"]
