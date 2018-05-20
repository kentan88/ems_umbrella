defmodule EMS.Ticketing.Queries.ListTickets do
  import Ecto.Query
  alias EMS.Ticketing.Schemas.Ticket

  @repo Application.get_env(:ems, :repo)

  def all(params \\ %{}) do
    from(o in Ticket) |> @repo.all()
  end
end
