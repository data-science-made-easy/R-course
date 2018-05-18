f <- function(n) {
  if (0 == n)
    return(1)
  else
    return(n * f(n-1))
}
​
# Test your solution
f(3) # 6