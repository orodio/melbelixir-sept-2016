defmodule BankTest do
  use ExUnit.Case, async: true
  doctest Bank
  import Bank



  test "Bank Balance Starts out as 0" do
    { :ok, account } = Bank.start_link

    assert 0 == balance(account)
  end



  test "We can deposit money" do
    { :ok, account } = Bank.start_link

    account
    |> deposit(50)

    assert 50 == balance(account)
  end



  test "We can withdraw money" do
    { :ok, account } = Bank.start_link

    account
    |> deposit(50)
    |> withdraw(40)

    assert 10 == balance(account)
  end



  # test "We cant withdraw negative money" do
  #   { :ok, account } = Bank.start_link

  #   account
  #   |> deposit(50)
  #   |> withdraw(-40)

  #   assert 50 == balance(account)
  # end



  # test "We cant deposit negative money" do
  #   { :ok, account } = Bank.start_link

  #   account
  #   |> deposit(50)
  #   |> deposit(-40)

  #   assert 50 == balance(account)
  # end



  # test "Not enough money to withdraw that amount" do
  #   { :ok, account } = Bank.start_link

  #   account
  #   |> deposit(50)
  #   |> withdraw(60)

  #   assert 50 == balance(account)
  # end



  # test "Bank.Opperations.calc_balance" do
  #   history = [
  #     deposit:  50,
  #     deposit:  50,
  #     withdraw: 50,
  #     withdraw: 60,
  #   ]

  #   assert -10 == Bank.Opperations.calc_balance(history)
  # end



end
