defmodule EMS.Ticketing do
  @moduledoc """
  The Ticketing context.

  order = %EMS.Sales.Schemas.Order{id: 101, ref_no: "hello"}
  {:ok, filepath} = EMS.Ticketing.generate_etickets(order)
  EMS.Ticketing.create_ticket(%{digest: "hello"})
  EMS.Ticketing.send_etickets(order)
  """

  alias EMS.Ticketing.Queries.ListTickets

  alias EMS.Ticketing.Commands.{
    CreateTicket,
    VoidTicket,
    ValidateTicket,
    GenerateETickets,
    SendETickets
  }

  alias EMS.Ticketing.Schemas.Ticket
  alias EMS.Sales.Schemas.Order

  @repo Application.get_env(:ems, :repo)

  def list_tickets(params \\ %{}) do
    params
    |> ListTickets.all()
  end

  def get_ticket(id) do
    Ticket
    |> @repo.get(id)
  end

  def create_ticket(attrs \\ %{}) do
    attrs
    |> CreateTicket.perform()
  end

  def send_etickets(%Order{} = order) do
    order
    |> SendETickets.perform()
  end

  def generate_etickets(%Order{} = order) do
    order
    |> GenerateETickets.perform()
  end

  def void_ticket(%Ticket{} = ticket) do
    ticket
    |> VoidTicket.perform()
  end

  def validate_ticket(%Ticket{} = ticket) do
    ticket
    |> ValidateTicket.perform()
  end
end
