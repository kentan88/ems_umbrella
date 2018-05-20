defmodule EMS.Ticketing.Commands.ValidateTicket do
  alias EMS.Ticketing.Schemas.Ticket
  require Logger

  # @repo Application.get_env(:ems, :repo)

  def perform(%Ticket{status: status} = ticket) do
    Logger.info("validating ticket:#{ticket.id} ...", ansi_color: :yellow)

    case status do
      "active" -> {true, ticket}
      _ -> {false, ticket}
    end
  end
end
