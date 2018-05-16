---
description: >-
  In mathematics, the factorial of a non-negative integer n, denoted by n!, is
  the product of all positive integers less than or equal to n. 0! = 1, by
  definition.
---

# Exercise 1: n!

A naive approach, without the use of a recurrence relation, may use a `for-loop` or a `while-loop`:

```r
f_naive <- function(n) {
    
  result <- 1
  for (i in 0:n) {
    if (0 < i)
      result <- result * i
  }

  return(result)
}
```

After pasting the code in R, you can test it e.g. by`f_naive(3)`, which should return `6`.

The goal is to write a recursive function `f(n)` that implements the factorial function n!. You can start using the following template.

{% tabs %}
{% tab title="Task" %}
```r
f <- function(n) {
  if ("Task-0" == "Put base case here")
    return(1)
  else
    return("Task-1: put recursion here")
}

# Test your solution
f(0) # Should return 1
f(3) # Should return 6
if (f_naive(7) == f(7)) cat("Good job!") else cat("Some work to do.")
```
{% endtab %}

{% tab title="Solution" %}
```r
f <- function(n) {
  if (0 == n)
    return(1)
  else
    return(n * f(n-1))
}

# Test your solution
f(0) # Should return 1
f(3) # Should return 6
if (f_naive(7) == f(7)) cat("Good job!") else cat("Some work to do.")
```
{% endtab %}
{% endtabs %}

One may argue that the recursive implementation is more intuitive. Don't you think so?

