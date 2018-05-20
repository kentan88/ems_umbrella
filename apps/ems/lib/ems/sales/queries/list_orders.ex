defmodule EMS.Sales.Queries.ListOrders do
  import Ecto.Query
  alias EMS.Sales.Schemas.Order

  @repo Application.get_env(:ems, :repo)

  def all(params \\ %{}) do
    from(o in Order) |> @repo.all()
  end
end
