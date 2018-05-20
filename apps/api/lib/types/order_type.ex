defmodule API.OrderType do
  defmacro __using__(_opts) do
    quote do
      object :order do
        @desc "A Order"
        field(:id, :id)
        field(:customer_email, :string)
        field(:customer_name, :string)
        field(:ref_no, :string)
        field(:status, :string)
      end
    end
  end
end
