defmodule EMS.Ticketing.Commands.SendETickets do
  alias EMS.Sales.Schemas.Order
  require Logger

  def perform(%Order{} = order) do
    Logger.info("sending e-tickets:#{order.id} ...", ansi_color: :yellow)
  end
end
