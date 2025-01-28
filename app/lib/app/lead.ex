defmodule App.Lead do
  use Ecto.Schema

  @primary_key {:id, :binary_id, autogenerate: true}
  schema "leads" do
    field :name, :string
    field :phone, :string

  end
end
