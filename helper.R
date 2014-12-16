adjustVariableNames <- function(x)
{

	r1 <- gsub("-mean\\(\\)", "Mean", x)
	r2 <- gsub("-std\\(\\)", "Std", r1)

	return(r2)
}