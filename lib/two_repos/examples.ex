defmodule TwoRepos.Examples do

    alias TwoRepos.WorstOfRepos.Repo
    alias TwoRepos.Person

    def test_perimssions() do
        Ecto.Adapters.SQL.query(Repo, "CREATE TABLE do_not_create_this_table (id int)", [])
    end

    def create_person(attrs) do
        %Person{}
        |> Person.changeset(attrs) 
        |> Repo.insert()
    end

    def get_person(id) do
        Person |> Repo.get(id)
    end

    def delete_person(id) do
        get_person(id) |> Repo.delete()
    end

    
end