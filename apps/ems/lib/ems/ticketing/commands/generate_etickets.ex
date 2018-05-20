defmodule EMS.Ticketing.Commands.GenerateETickets do
  alias EMS.Sales.Schemas.Order

  def perform(%Order{} = order) do
    PDF.html("eticket", [])
    |> PDF.generate(%{filename: order.ref_no})
  end
end
