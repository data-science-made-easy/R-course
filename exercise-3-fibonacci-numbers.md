# Exercise 2: Fibonacci numbers

In the [**Fibonacci sequence**](https://en.wikipedia.org/wiki/Fibonacci_number) every number after the first two is the sum of the two preceding ones:

```r
1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, ...
```

{% hint style="info" %}
Fibonacci once used the sequence to model an idealised \(biologically unrealistic\) rabbit population. Nowadays, there are multiple [applications of Fibonacci numbers](https://en.wikipedia.org/wiki/Fibonacci_number#Applications) in mathematics, computer science, biology, and [economics](https://link.springer.com/article/10.1007%2Fs10957-012-0061-2).
{% endhint %}

Of course, there is a straightforward non-recursive iterative implementation, but here we want to implement a recursive function giving the _n_-th Fibonacci number.

**Task: can you implement fib\(n\) in a recursive fashion?**

{% tabs %}
{% tab title="Tasks" %}
**Can you implement fib\(n\) in a recursive fashion?**

```r
fib <- function(n) {
  # Start with the two base cases
  if ("Task-0:" == n)
    return("Base case 1")
  if ("Task-1:" == n)
    return("Base case 2")

  # Now the recursive step
  return("Task-2: recursion")
}
```
{% endtab %}

{% tab title="Test your solution" %}
No giveaways this time :-\)

```r
# Test
fib(30) == 832040
```
{% endtab %}
{% endtabs %}

