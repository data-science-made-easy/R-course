rm(list=ls())

MoveDisks = function(n, source, dest, extra, tower) {
	if (n == 0)	{
    
    # Base case: do nothing
    
	} else { # 0 < n
    
    # First move the top n - 1 disks from 'source' ==> 'extra'
		tower <- MoveDisks(n - 1, source = source, dest = extra, extra = dest, tower = tower)

    # Now move disk at bottom from 'source' ==> 'dest'
		disk            <- tower[[source]][1]     # get the disk from source
		tower[[source]] <- tower[[source]][-1]    # remove disk from source
		tower[[dest]]   <- c(disk, tower[[dest]]) # prepend disk to dest

    # Show what we did:
    print_tower(tower)
    
    # Last move the top n - 1 disks from 'extra' ==> 'dest'
		tower <- MoveDisks(n - 1, source = extra, dest = dest, extra = source, tower = tower)
	}
	
	# return our new tower
	return(invisible(tower))
}

print_tower <- function(tower) {
  get_peg <- function(index) stringr::str_pad(paste0(LETTERS[index], ":", paste0(rev(tower[[index]]), collapse = "")), 7, "right")  
  cat(paste0(get_peg(1), get_peg(2), get_peg(3), "\n"))
}

n <- 3
tower <- list(1:n, c(), c())
print_tower(tower)
MoveDisks(n, source = 1, dest = 3, extra = 2, tower)