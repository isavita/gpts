Regex.replace(~r/-/, "one-two-three", "_")

Regex.scan(~r/foo([0-9])/, "foo1 foo2 bar3 foo4")

Tuple.to_list({:a, :b, :c})

pow3 = fn(x) -> :math.pow(x, 3) end
1..10
|> Enum.readuce(0, fn(x, acc) -> pow3.(x) + acc end)
