defmodule EMS.Ticketing.Schemas.Ticket do
  use Ecto.Schema

  schema "tickets" do
    field(:digest, :string)
    field(:status, :string)
    field(:order_id, :id)

    timestamps()
  end

  use ExConstructor
end
