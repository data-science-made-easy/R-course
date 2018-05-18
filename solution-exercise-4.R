if (!is.element("stringr", installed.packages()[,"Package"]))
  install.packages("stringr")

print_towers <- function(towers) {
  get_peg <- function(index) {
    stringr::str_pad(paste0(LETTERS[index], ":", paste0(rev(towers[[index]]), collapse = "")), 7, "right")
  }
  cat(paste0(get_peg(1), get_peg(2), get_peg(3), "\n"))
}

MoveDisks = function(n, source, dest, extra, towers) {
  if (0 == n)	{
    # base case: do nothing
  } else { # 0 < n
    # First move the top n - 1 disks from 'source' ==> 'extra'
    towers <- MoveDisks(n - 1, source = source, dest = extra, extra = dest, towers) # recursive step 1
​
    # Now move disk at bottom from 'source' ==> 'dest'
  	disk             <- towers[[source]][1]     # get the disk from source
  	towers[[source]] <- towers[[source]][-1]    # remove disk from source
  	towers[[dest]]   <- c(disk, towers[[dest]]) # prepend disk to dest
​
    # Show what we did:
    print_towers(towers)
    
    # Last move the top n - 1 disks from 'extra' ==> 'dest'
    towers <- MoveDisks(n - 1, source = extra, dest = dest, extra = source, towers = towers) # recursive step 2
  }
	
  # return new towers
  return(invisible(towers))
}

n <- 3
towers <- list(A = 1:n, B = c(), C = c())
print_towers(towers)
MoveDisks(n, source = "A", dest = "C", extra = "B", towers)
