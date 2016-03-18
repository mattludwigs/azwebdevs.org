use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :org_api, OrgApi.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :org_api, OrgApi.Repo,
  adapter: Mongo.Ecto,
  database: "org_api_test",
  pool_size: 1