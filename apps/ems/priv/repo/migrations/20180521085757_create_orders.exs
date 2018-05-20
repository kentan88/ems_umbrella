defmodule EMS.Repo.Migrations.CreateOrders do
  use Ecto.Migration

  def change do
    create table(:orders) do
      add :customer_name, :string
      add :customer_email, :string
      add :status, :string
      add :ref_no, :string

      timestamps()
    end

  end
end
