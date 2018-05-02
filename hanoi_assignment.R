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