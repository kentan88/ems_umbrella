defmodule Ems.SalesTest do
  use Ems.DataCase

  alias Ems.Sales

  describe "orders" do
    alias Ems.Sales.Order

    @valid_attrs %{
      customer_email: "some customer_email",
      customer_name: "some customer_name",
      status: "some status"
    }
    @update_attrs %{
      customer_email: "some updated customer_email",
      customer_name: "some updated customer_name",
      status: "some updated status"
    }
    @invalid_attrs %{customer_email: nil, customer_name: nil, status: nil}

    def order_fixture(attrs \\ %{}) do
      {:ok, order} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Sales.create_order()

      order
    end

    test "list_orders/0 returns all orders" do
      order = order_fixture()
      assert Sales.list_orders() == [order]
    end

    test "get_order!/1 returns the order with given id" do
      order = order_fixture()
      assert Sales.get_order!(order.id) == order
    end

    test "create_order/1 with valid data creates a order" do
      assert {:ok, %Order{} = order} = Sales.create_order(@valid_attrs)
      assert order.customer_email == "some customer_email"
      assert order.customer_name == "some customer_name"
      assert order.status == "some status"
    end

    test "create_order/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Sales.create_order(@invalid_attrs)
    end

    test "update_order/2 with valid data updates the order" do
      order = order_fixture()
      assert {:ok, order} = Sales.update_order(order, @update_attrs)
      assert %Order{} = order
      assert order.customer_email == "some updated customer_email"
      assert order.customer_name == "some updated customer_name"
      assert order.status == "some updated status"
    end

    test "update_order/2 with invalid data returns error changeset" do
      order = order_fixture()
      assert {:error, %Ecto.Changeset{}} = Sales.update_order(order, @invalid_attrs)
      assert order == Sales.get_order!(order.id)
    end

    test "delete_order/1 deletes the order" do
      order = order_fixture()
      assert {:ok, %Order{}} = Sales.delete_order(order)
      assert_raise Ecto.NoResultsError, fn -> Sales.get_order!(order.id) end
    end

    test "change_order/1 returns a order changeset" do
      order = order_fixture()
      assert %Ecto.Changeset{} = Sales.change_order(order)
    end
  end
end
