defmodule Bank do
  use GenServer
  import Bank.Opperations



  def start_link,        do: start_link([])
  def start_link(state), do: Agent.start_link fn() -> state end



  def balance(agent) do
    Agent.get agent, fn(history) -> calc_balance(history) end
  end



  def deposit(agent, amount) when amount <= 1, do: agent
  def deposit(agent, amount) do
    Agent.update agent, &[{:deposit, amount} | &1]
    agent
  end



  def withdraw(agent, amount) when amount <= 0, do: agent
  def withdraw(agent, amount) do
    Agent.update agent, fn(history) ->
      case calc_balance(history) do
        balance when balance >= amount -> [{:withdraw, amount} | history]
        balance when balance <  amount -> history
      end
    end
    agent
  end
end
