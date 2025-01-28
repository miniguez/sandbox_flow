defmodule App.Repo.Migrations.CreateLeads do
  use Ecto.Migration

  def change do
    create table(:leads, primary_key: false) do
      add :id, :uuid, primary_key: true, default: fragment("gen_random_uuid()")
      add :name, :string
      add :phone, :string

      timestamps()
    end
  end
end
