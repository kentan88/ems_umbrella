defmodule EMS.Application do
  @moduledoc """
  The EMS Application Service.

  The ems system business domain lives in this application.

  Exposes API to clients such as the `EMSWeb` application
  for use in channels, controllers, and elsewhere.
  """
  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    Supervisor.start_link(
      [
        supervisor(EMS.Repo, [])
      ],
      strategy: :one_for_one,
      name: EMS.Supervisor
    )
  end
end
