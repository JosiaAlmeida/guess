# defmodule é um modulo, o elixir trabalha com modulos
# Tudo que fica entre o do e end está dentro do mesmo escopo
# def -> Serve para criar uma função

# Podemos criar varias funções com o mesmo nome, porém as mais generica ficam no final
# A regra de prioridade é igual ao css

defmodule Guess do
  use Application

  def start(_,_) do
    run()
    {:ok, self()}
  end

  def run do
    IO.puts("Let´s play guess the number")

    IO.gets("Pick a difficult level (1 - 3): ")
    |> parse_input()
    |> pick_number()
    |> IO.inspect()
  end

  def pick_number(level) do
    level
    |> get_range()
    |> Enum.random()
  end

  def parse_input(:error) do
    IO.puts("Invalid level!!")
    run()
  end
  def parse_input({num, _}), do: num
  def parse_input(data) do
    data|> Integer.parse()
        |> parse_input()
  end
  def get_range(value) do
    case value do
      1 -> 1..10
      2 -> 1..100
      3 -> 1..1000
      _ -> IO.puts("Please, choose a level valid")
      run()
    end
  end
end
