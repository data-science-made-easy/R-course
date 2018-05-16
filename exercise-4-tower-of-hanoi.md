---
description: Can you invent an algorithm solving the well-known Tower of Hanoi?
---

# Exercise 4: Tower of Hanoi

## Introduction

The [Tower of Hanoi](https://en.wikipedia.org/wiki/Tower_of_Hanoi) starts with `n` differently sized disks placed on top of each other on a peg. There are three pegs, say `A`, `B` and `C`. Let's number the disks `1..n` from top to bottom; i.e. small to large. Goal is to move all disks from the left peg \(`A`\) to the right peg \(`C`\), using the peg in the middle \(`B`\), obeying two rules:  
1. move one disk at a time  
2. never put a disk on a smaller one 

![Can you come up with a recipe to move the full tower from left to right?](.gitbook/assets/tower_of_hanoi.jpeg)

## Analysis of the problem

![Animated version for three disks.](.gitbook/assets/tower_of_hanoi.gif)

At one point we need to move the largest disk \(disk `n`\) from `A` to `C`. You should realise, that we can do this, only if disks `1..n-1` are on `B`. So, first we move `n-1` disks from `A` to `B`. Then, we move disk `n` from `A` to `C`. Last, we move disks `1..n-1` from `B` to `C`. Please note that doing so, the big disk `n` will never bother us while we are moving disks `1..n-1`, as it is always at the bottom.

So, given a solution for `n-1` disks, we can solve the puzzle for `n` disks. This sounds like a recursive step, right?

You'll understand that to move the top `n-1` disks, you first need to move the top `n-2` disks, and so on. So, `n` becomes smaller and smaller. What would be the smallest `n` you can think of for which you can solve the puzzle? This you can use to define your base step.

Moving `n=1` disks is quite trivial, right? But can you think of a base step that is even easier to solve?

Right!  Moving `n=0` disks is even easier: you just do nothing :-\)

## From analysis to a program

Let's first define a data structure holding the disks. Let `n` be the total number of disks. In R, `1:n` is a vector `1, 2, ..., n` representing the individual disks from small to large. We can represent a state of the `towers` by a list with three positions \(representing pegs `A, B, C`\), each holding a vector with disks.

```r
library(stringr) # Used in print function below
n <- 3
towers <- list(A = 1:n, B = c(), C = c())
```

Please inspect `towers` as is.

Let's create a print function for better representation:

```r
print_towers <- function(towers) {
  get_peg <- function(index) {
    str_pad(paste0(LETTERS[index], ":", paste0(rev(towers[[index]]), collapse = "")), 7, "right")
  }
  cat(paste0(get_peg(1), get_peg(2), get_peg(3), "\n"))
}
```

Let's first print the initial towers:

```r
print_towers(towers)
# A:321  B:     C:     
```

Initially, all disks are at peg A, smallest at top.

{% hint style="info" %}
Please note that the vector `towers[["A"]]` represents the initial disks on peg A \(initially `1 2 3`\). Its first element, `towers[["A"]][1]`, is `1` and is at the top of peg `A`, while its last element `towers[["A"]][n]` is `3` and is at its bottom. For your convenience, our print function shows the disks in reverse order. See _e.g._ tower `A:321`in the print example above.
{% endhint %}

{% tabs %}
{% tab title="Task-0" %}
**Can you manually move the top disk from peg A to peg B? Please print the resulting towers.**

```r
disk <- towers[["A"]][1]             # get the disk
towers[["A"]] <- towers[["A"]][-1]    # remove disk from source
towers[["B"]] <- "prepend disk"      # use function c() to prepend disk to stack B

print_towers(towers)
# Result should be:
# A:32   B:1    C:
```
{% endtab %}

{% tab title="Hint using c\(\)" %}
The function c\(\) can combine vectors and values. You can try the following.

```r
a <- 1:3
c(0, a)
```

Remark: all values in a vector are of the same type. The values in `c(0, a)` are numeric. However, adding a string to the vector will convert all values to characters:

```text
c("hi", a)
```
{% endtab %}
{% endtabs %}

Now you have all the skills you need to make the recursive function moving the disks. Let's call this function `MoveDisks`and let's make it work so the following function call will move all `n` disks from peg 1 to peg 3. As arguments we give the number of disks to be moved \(`n`\), the `source` peg, `dest`ination peg, the `extra` peg, and also the `towers` in its initial \(or current\) state. So, the following function call of MoveDisks should do the job:

```r
towers <- list(A = 1:n, B = c(), C = c())
print_towers(towers)
# A:321  B:     C:  
MoveDisks(n, source = "A", dest = "C", extra = "B", towers)
# This function call should print the towers each time a disk is moved,
# ending with the final state:
# A:     B:     C:321
```

## Implementing the recursive function MoveDisks

Below you find a template of the function. First try to define the _base case_. Next, add the two lines of code in which the recursion happens.

```r
MoveDisks = function(n, source, dest, extra, towers) {
  if (n == "Task-1: smallest n you can think of")	{
    # base case: do nothing
  } else { # 0 < n
    # First move the top n - 1 disks from 'source' ==> 'extra'
    towers <- MoveDisks(stop("Task-2")) # recursive step 1

    # Now move disk at bottom from 'source' ==> 'dest'
	disk             <- towers[[source]][1]     # get the disk from source
	towers[[source]] <- towers[[source]][-1]    # remove disk from source
	towers[[dest]]   <- c(disk, towers[[dest]]) # prepend disk to dest

    # Show what we did:
    print_towers(towers)
    
    # Last move the top n - 1 disks from 'extra' ==> 'dest'
    towers <- MoveDisks(stop("Task-3")) # recursive step 2
  }
	
  # return new towers
  return(invisible(towers))
}
```

**Task-4:** can you demonstrate your solution works for four disks?

```r
n <- 4
towers <- list(A = 1:n, B = c(), C = c())
MoveDisks(n, source = "A", dest = "C", extra = "B", towers)
```



