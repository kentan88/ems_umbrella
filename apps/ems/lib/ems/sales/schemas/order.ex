defmodule EMS.Sales.Schemas.Order do
  use Ecto.Schema

  schema "orders" do
    field(:customer_email, :string)
    field(:customer_name, :string)
    field(:ref_no, :string)
    field(:status, :string)

    timestamps()
  end

  use ExConstructor
end
