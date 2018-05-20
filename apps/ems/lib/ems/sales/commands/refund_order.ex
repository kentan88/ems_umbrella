defmodule EMS.Sales.Commands.RefundOrder do
  alias EMS.Sales.Schemas.Order
  require Logger

  @repo Application.get_env(:ems, :repo)

  def perform(%Order{} = order) do
    Logger.info("refunding order:#{order.id} ...", ansi_color: :yellow)
    {:ok}
  end
end
