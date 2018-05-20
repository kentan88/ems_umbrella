defmodule API.Resolvers.Viewer do
  alias EMS.Sales

  def get(_parent, _params, _info) do
    orders = Sales.list_orders()
    {:ok, %{orders: orders}}
  end
end
