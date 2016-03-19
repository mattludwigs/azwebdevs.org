ExUnit.start

Mix.Task.run "ecto.create", ~w(-r Org.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r Org.Repo --quiet)


