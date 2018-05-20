defmodule API.Resolvers.Sales.ListOrders do
  alias EMS.Sales

  def all(_parent, _params, _info) do
    orders = Sales.list_orders()
    {:ok, orders}
  end
end
