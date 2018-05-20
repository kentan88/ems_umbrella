defmodule EMS.Sales.Commands.CancelOrder do
  import Ecto.Changeset
  alias EMS.Sales.Schemas.Order
  require Logger

  @repo Application.get_env(:ems, :repo)

  def perform(%Order{} = order) do
    with {:ok, updated_order} <-
           order
           |> changeset
           |> @repo.update do
      Task.start(fn ->
        # TODO: EMS.Mailer.send_cancellation_email(updated_order)
        Logger.info("Send cancellation email on a separate task!")
        :timer.sleep(1000)
        Logger.info("Email sent after 1 second!")
      end)

      {:ok, updated_order}
    end
  end

  def changeset(%Order{} = order) do
    order
    |> cast(%{status: "cancelled"}, [:status])
  end
end
