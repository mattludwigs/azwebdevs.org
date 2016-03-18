ExUnit.start

Mix.Task.run "ecto.create", ~w(-r OrgApi.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r OrgApi.Repo --quiet)


