f <- function(n) {
  if (0 == n)
    return(1)
  else
    return(n * f(n-1))
}
​
f(3) # 6