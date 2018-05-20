defmodule EMS.Repo.Migrations.CreateTickets do
  use Ecto.Migration

  def change do
    create table(:tickets) do
      add :digest, :string
      add :status, :string
      add :order_id, references(:orders, on_delete: :nothing)

      timestamps()
    end

    create index(:tickets, [:order_id])
    create index(:tickets, [:order_id, :status])
  end
end
