--How many different ways can we make change of $ 1.00, given half-dollars, 
--quarters, dimes, nickels, and pennies? More generally, can we write a 
--procedure to compute the number of ways to change any given amount of money?
coins = {1, 5, 10, 25, 50}

function initArray(length, array)
  for i = 1,length do
    array[i] = 0
  end
  array[0] = 1
end

function addCoin(value, result, i)
  local j = i-value
  if j >= 0 then result[i] = result[i] + result[j] end
end

function count_change(amount)
  local result = {}
  initArray(amount, result)
  for i = 1, #coins do
    for j = 1, #result do
      addCoin(coins[i], result, j)
    end
  end
  return result[amount]
end

print(count_change(100))

--output: 292
