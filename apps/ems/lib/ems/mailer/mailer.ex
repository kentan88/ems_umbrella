defmodule EMS.Mailer do
  alias EMS.Mailer.Commands.{SendConfirmationEmail, SendCancellationEmail}

  def send_confirmation_email(order) do
    SendConfirmationEmail.perform(order)
  end

  def send_cancellation_email(order) do
    SendCancellationEmail.perform(order)
  end
end
