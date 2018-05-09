rm(list=ls())

MoveTower = function(n, source, dest, extra, tower)
{
	if (n == 0)	{
    
    # Base case: do nothing
    
	} else { # 0 < n
    
    # First move the top n - 1 disks from 'source' ==> 'extra'
		tower <- MoveTower(n - 1, source = source, dest = extra, extra = dest, tower = tower)

    # Now move disk at bottom from 'source' ==> 'dest'
		disk            <- tower[[source]][1]     # get the disk from source
		tower[[source]] <- tower[[source]][-1]    # remove disk from source
		tower[[dest]]   <- c(disk, tower[[dest]]) # prepend disk to dest

    # print what we did
		cat("Move disk", disk, "from", LETTERS[source], "to", LETTERS[dest], "\n")
    
    # Last move the top n - 1 disks from 'extra' ==> 'dest'
		tower <- MoveTower(n - 1, source = extra, dest = dest, extra = source, tower = tower)
	}
	
	# return our new tower
	return(tower)
}


n <- 3
tower <- list(1:n, c(), c())
MoveTower(n, source = 1, dest = 2, extra = 3, tower)