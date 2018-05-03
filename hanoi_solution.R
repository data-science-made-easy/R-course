rm(list=ls()) # Remove all objecs, be sure you work with a clean environment

MoveTower = function(n, source, dest, via, tower)
{
	# MoveTower moves n disks from pilar source to pilar dest via pilar spare in tower 'tower'
	if (n == 1)
	{
		# get the disk
		disk = tower[[source]][1]

		# print how to move disk
		cat("Move disk", disk, "from", LETTERS[source], "to", LETTERS[dest], "\n")
		
		# prepend disk to dest
		tower[[dest]] = c(disk, tower[[dest]])
		
		# remove disk from source
		tower[[source]] = tower[[source]][-1]
	}
	else # 1 < n
	{
		tower = MoveTower(n - 1, source, via, dest, tower)
		tower = MoveTower(1, source, dest, via, tower)
		tower = MoveTower(n - 1, via, dest, source, tower)
	}
	
	# return our new tower
	return( tower )
}


n = 3
tower = list(1:n, c(), c())
MoveTower(n , 1, 2, 3, tower)