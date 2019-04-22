defmodule TwoRepos.BestOfRepos.Repo.Migrations.CreateAppUser do
  use Ecto.Migration

  def change do
    app_user = Application.get_env(:two_repos, TwoRepos.WorstOfRepos.Repo)[:username]
    password = Application.get_env(:two_repos, TwoRepos.WorstOfRepos.Repo)[:password]
    database_name = Application.get_env(:two_repos, TwoRepos.WorstOfRepos.Repo)[:database]
    system_role = Application.get_env(:two_repos, TwoRepos.BestOfRepos.Repo)[:username]
     
 
    execute create_app_user_role(app_user, password)
    execute revoke_create_on_schema()
    execute revoke_all_for_user()
    execute grant_connect_to_user(database_name, app_user)
    execute revoke_connect_on_db(database_name)
    execute grant_usage_on_sequences(app_user)
    execute grant_usage_on_schema(app_user)
    execute grant_privileges_to_user(app_user)
    execute alter_default_sequence_privileges(system_role, app_user)
    execute alter_default_table_privileges(system_role, app_user)
  end

  def create_app_user_role(app_user, password) do
    ~s( CREATE USER "#{app_user}" WITH ENCRYPTED PASSWORD '#{password}' NOINHERIT;)
  end
 
  def revoke_create_on_schema(), do: ~s(REVOKE CREATE ON SCHEMA PUBLIC FROM PUBLIC;)
  
  def revoke_all_for_user(), do: ~s(REVOKE ALL ON ALL TABLES IN SCHEMA public FROM PUBLIC;)
 
  def revoke_connect_on_db(database_name), do: ~s(REVOKE CONNECT ON DATABASE "#{database_name}" FROM PUBLIC;)
 
  def grant_connect_to_user(database, app_user), do: ~s(GRANT CONNECT ON DATABASE "#{database}" TO "#{app_user}";)
 
  def grant_usage_on_schema(app_user), do: ~s(GRANT USAGE ON SCHEMA PUBLIC TO "#{app_user}";)
  
  def grant_usage_on_sequences(app_user), do: ~s(GRANT USAGE, SELECT, UPDATE ON ALL SEQUENCES IN SCHEMA public TO "#{app_user}";)
 
  def grant_privileges_to_user(app_user), do: ~s(GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public TO "#{app_user}";)
 
  def alter_default_sequence_privileges(system_role, app_user) do
    ~s(ALTER DEFAULT PRIVILEGES FOR USER "#{system_role}" IN SCHEMA public GRANT SELECT, USAGE, UPDATE ON SEQUENCES TO "#{app_user}";)
  end
 
  def alter_default_table_privileges(system_role, app_user) do
    ~s(ALTER DEFAULT PRIVILEGES FOR USER "#{system_role}" IN SCHEMA public GRANT SELECT, INSERT, UPDATE, DELETE ON TABLES TO "#{app_user}";)
  end
  
end