defmodule API.ViewerType do
  defmacro __using__(_opts) do
    quote do
      object :viewer do
        @desc "Viewer"
        field(:id, :id)
        field(:orders, list_of(:order))
      end
    end
  end
end
