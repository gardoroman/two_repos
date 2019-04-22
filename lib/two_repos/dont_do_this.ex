defmodule DontDoThis do

    alias TwoRepos.WorstOfRepos.Repo

    def test_perimssions() do
        Ecto.Adapters.SQL.query(Repo, "CREATE TABLE do_not_create (id int)", [])
    end
end