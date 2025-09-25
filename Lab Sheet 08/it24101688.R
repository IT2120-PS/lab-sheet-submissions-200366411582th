setwd("C:\\Users\\thvit\\Desktop\\IT24101688")


# 1. 

weights <- c(2.5, 3.0, 2.8, 3.2, 2.9, 3.1, 2.7, 2.6, 3.0, 2.8)    

true_mean <- mean(weights)

true_var <- var(weights) * ((length(weights)-1)/length(weights))

true_sd <- sqrt(true_var)

cat("Population Mean:", true_mean, "\n")
cat("Population Variance:", true_var, "\n")
cat("Population Standard Deviation:", true_sd, "\n\n")


# 2. 

set.seed(123)  

sample_means <- c()
sample_sds   <- c()

for(i in 1:25){
  s <- sample(weights, size=6, replace=TRUE)
  sample_means[i] <- mean(s)
  sample_sds[i]   <- sd(s)
}

cat("Sample Means (25 samples):\n")
print(sample_means)
cat("\nSample Standard Deviations (25 samples):\n")
print(sample_sds)


# 3. 

mean_of_means <- mean(sample_means)
sd_of_means   <- sd(sample_means)

cat("\nMean of Sample Means:", mean_of_means, "\n")
cat("Standard Deviation of Sample Means:", sd_of_means, "\n\n")


# 4. 

cat("Comparison:\n")
cat("Population Mean vs Mean of Sample Means -> Nearly Equal\n")
cat("Population SD vs SD of Sample Means -> SD of sample means ≈ Population SD / sqrt(n)\n")

