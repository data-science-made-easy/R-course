# R course
This course is an introduction into R for starters in data science.

## Installation and basics
First install R or RStudio and get familiar with R's basics, following [this link](https://cran.r-project.org/doc/contrib/Torfs+Brauer-Short-R-Intro.pdf "Get to know the basics").

## Regular functions
In R you can write your own functions, e.g.:

```R
factorial <- function(n) {
  result <- 1
  if (0 < n) {
    for (i in 1:n) {
      result <- result * i
    }
  }
  return(result)
}
```

## Recursive functions
The factorial function can be implemented in a recursive way, too.

```R
factorial <- function(n) {
  if (0 == n) { # base
    return(1)
  } else { # recursive step
    return(n * factorial(n - 1))
  }
}
```

## Exercise
Your goal is to implement a recursive function solving the [Tower of Hanoi](https://en.wikipedia.org/wiki/Tower_of_Hanoi). We have created most of the code for you:

```R
MoveTower = function(n, source, dest, via, tower)
{
	# MoveTower moves n disks from pilar source to pilar dest via pilar spare in tower 'tower'
	if (n == 1)
	{
		# get the disk
		disk = tower[[source]][1]

		# print how to move disk
		cat("Move disk", disk, "from", LETTERS[source], "to", LETTERS[dest], "\n")
		
		# prepend disk to dest (TO DO 1)
		
		# remove disk from source (TO DO 2)

	}
	else # 1 < n
	{
		# magic here! (TO DO 3)
	}
	
	# return our new tower
	return( tower )
}
```

You can find the source code [here](). Your assignment is to fill in the three holes marked with (TO DO 1, 2, 3).

If you successfully did so, you may run the following test.
```R
n = 3
tower = list(1:n, c(), c())
MoveTower(n , source = 1, dest = 2, via = 3, tower)
```

Which will give you the solution for three disks:

- Move disk 1 from A to B 
- Move disk 2 from A to C 
- Move disk 1 from B to C 
- Move disk 3 from A to B 
- Move disk 1 from C to A 
- Move disk 2 from C to B 
- Move disk 1 from A to B 
