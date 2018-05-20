defmodule EMS.Sales do
  @moduledoc """
  The Sales context.

  {:ok, place_order} =
    EMS.Sales.place_order(%{
      customer_name: "Ken Tan",
      customer_email: "ken@qwerty.com",
    })

  place_order = EMS.Sales.get_order(1)
  EMS.Sales.cancel_order(place_order)
  """

  alias EMS.Sales.Queries.ListOrders
  alias EMS.Sales.Commands.{PlaceOrder, CancelOrder, RefundOrder}
  alias EMS.Sales.Schemas.Order

  @repo Application.get_env(:ems, :repo)

  def list_orders(params \\ %{}) do
    params
    |> ListOrders.all()
  end

  def get_order(id) do
    @repo.get(Order, id)
  end

  def place_order(attrs \\ %{}) do
    attrs
    |> PlaceOrder.perform()
  end

  def cancel_order(%Order{} = order) do
    order
    |> CancelOrder.perform()
  end

  def refund_order(%Order{} = order) do
    order
    |> RefundOrder.perform()
  end
end
