defmodule EMS.Sales.Commands.PlaceOrder do
  import Ecto.Changeset
  alias EMS.Sales.Schemas.Order

  @repo Application.get_env(:ems, :repo)

  def perform(attrs) do
    attrs
    |> Order.new()
    |> changeset
    |> @repo.insert
  end

  def changeset(%Order{} = place_order) do
    %Order{}
    |> cast(Map.from_struct(place_order), [:customer_name, :customer_email])
    |> validate_required([:customer_name, :customer_email])
  end
end
