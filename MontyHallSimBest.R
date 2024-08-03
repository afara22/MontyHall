

#Prompt user to adjust settings as desired
N <- as.integer(readline("Sample Size: "))
method <- readline("Switch or No Switch(S or N): ")
#additional setting added
numDoors <- as.integer(readline("How many doors total: "))

#Declare empty vector of size N
results <- rep(NA, N)

#Switch
if (method == 'S') {
  for(i in 1:N) {
    randomized_vector <- sample(c(rep("G", numDoors - 1), "C"))
    doorPicked <- sample(1:numDoors, size = 1)
    #Stores win/loss in results vector
    if (randomized_vector[doorPicked] == "G") {
      results[i] <- "W"
    }
    else {
      results[i] <- "L"
    }
  }
} else if (method == 'N') { #No switch
  for(i in 1:N) {
    randomized_vector <- sample(c(rep("G", numDoors - 1), "C"))
    doorPicked <- sample(1:numDoors, size = 1)
    #Stores win/loss in results vector
    if (randomized_vector[doorPicked] == "C") {
      results[i] <- "W"
    }
    else {
      results[i] <- "L"
    }
  }
}

#output win/loss ratios
winRatio <- sum(results == "W") / N
lossRatio <- sum(results == "L") / N
cat("Sample Proportion of Wins: ", winRatio)
cat("Sample Proportion of Losses: ", lossRatio)

barplot(c(winRatio, lossRatio), width = .04, main = "Results",
        xlab = "Wins/Losses", ylab = "Proportion",
        xlim = NULL, ylim = NULL)


  