defmodule TwoRepos.WorstOfRepos.Repo.Migrations.CreateUnauthorizedTable do
  use Ecto.Migration

  def change do
    execute "CREATE TABLE t1 (id int);"
  end
end
