defmodule API.Schema do
  use Absinthe.Schema
  import_types(API.Types)
  alias API.Resolvers.{Sales, Viewer}

  query do
    field :get_orders, type: list_of(:order) do
      resolve(&Sales.ListOrders.all/3)
    end

    # return only records belonging to viewer
    field :viewer, type: :viewer do
      resolve(&Viewer.get/3)
    end
  end
end
