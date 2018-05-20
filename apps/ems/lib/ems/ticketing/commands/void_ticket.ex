defmodule EMS.Ticketing.Commands.VoidTicket do
  import Ecto.Changeset
  alias EMS.Ticketing.Schemas.Ticket

  @repo Application.get_env(:ems, :repo)

  def perform(%Ticket{} = ticket) do
    ticket
    |> changeset
    |> @repo.update
  end

  def changeset(%Ticket{} = ticket) do
    ticket
    |> cast(%{status: "voided"}, [:status])
  end
end
