defmodule EMS.Ticketing.Commands.CreateTicket do
  import Ecto.Changeset
  alias EMS.Ticketing.Schemas.Ticket

  @repo Application.get_env(:ems, :repo)

  def perform(attrs) do
    attrs
    |> Ticket.new()
    |> changeset
    |> @repo.insert
  end

  def changeset(%Ticket{} = generate_ticket) do
    %Ticket{}
    |> cast(Map.from_struct(generate_ticket), [:digest])
    |> validate_required([:digest])
  end
end
