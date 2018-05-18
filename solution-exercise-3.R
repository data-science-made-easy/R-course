# The function n_girls simulates the children of a random family
# and returns the number of girls.
n_girls <- function() {
  is_boy <- .5 < runif(1)
  if (is_boy)
    return(0)
  else
    return(1 + n_girls())
}

# Returns a vector with the simulated number of girls per family
n_girls_per_fam <- function(n_fam) {
    vec <- NULL
    for (i in 1:n_fam)
        vec[i] <- n_girls()
    return(vec)
}
​
n_fam <- 1000 # Let's assume 1000 families
​
fam_vec <- n_girls_per_fam(n_fam)
​
hist(fam_vec, main = "Histogram new policy", xlab = "Number of girls per family")

fraction_girls <- function(fam_vec) {
  n_boys <- length(fam_vec)
  n_girls <- sum(fam_vec)
  
  fraction <- n_girls / (n_boys + n_girls)
  return(fraction)
}

#
## Simulate the above 100 times
#
n_sim <- 100
​
fg <- NULL
for (i in 1:n_sim) {
    vec <- n_girls_per_fam(n_fam)
    fg[i] <- fraction_girls(vec)
}

# Histogram of simulated distribution of fraction
hist(fg, main = "Histogram new policy",
           xlab = "Fraction of girls", xlim = c(0, 1))
abline(v = 1/2, col = "orange", lwd = 2)

# Can you assume normality? 
t.test(x = fg, mu = 1/2)$p.value