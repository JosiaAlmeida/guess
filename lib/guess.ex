# defmodule é um modulo, o elixir trabalha com modulos
# Tudo que fica entre o do e end está dentro do mesmo escopo
# def -> Serve para criar uma função

defmodule Guess do
  use Application

  def start(_,_) do
    run()
    {:ok, self()}
  end

  def run do
    IO.puts("Let´s play guess the number")

    IO.gets("Pick a difficult level (1 - 3): ")
    |> Integer.parse()
    |> parse_input()
    |> IO.inspect()
  end
  def parse_input(:error) do
    IO.puts("Invalid level!!")
    run()
  end
  def parse_input({num, _}), do: num
end
