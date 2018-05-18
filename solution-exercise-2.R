fib <- function(n) {
  if (1 == n || 2 == n)
    return(1)
  else
    return(fib(n-1) + fib(n-2))
}

# Test
fib(30) == 832040