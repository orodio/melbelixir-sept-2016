defmodule Bank.Opperations do
  def calc_balance(history), do: Enum.reduce(history, 0, &balance_reducer/2)

  defp balance_reducer({:deposit,  value}, acc), do: acc + value
  defp balance_reducer({:withdraw, value}, acc), do: acc - value
  defp balance_reducer(_event, acc),             do: acc
end
