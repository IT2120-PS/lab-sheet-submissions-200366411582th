setwd("C:\\Users\\thvit\\Desktop\\IT24101688")

set.seed(123)               
n <- 25
mu_true <- 45
sigma <- 2
sample_times <- rnorm(n, mean = mu_true, sd = sigma)


print(sample_times)
cat("Sample mean =", mean(sample_times), "\n")
cat("Sample size =", n, "\n")




xbar <- mean(sample_times)
z_stat <- (xbar - 46) / (sigma / sqrt(n))
p_value_z_one_sided <- pnorm(z_stat)  

cat("\nZ-test (sigma known):\n")
cat("z =", z_stat, "\n")
cat("one-sided p-value =", p_value_z_one_sided, "\n")

alpha <- 0.05
if (p_value_z_one_sided < alpha) {
  cat("Result: Reject H0 at alpha =", alpha, " => evidence mean < 46\n")
} else {
  cat("Result: Fail to reject H0 at alpha =", alpha, " => no evidence mean < 46\n")
}

tres <- t.test(sample_times, mu = 46, alternative = "less")
cat("\nT-test (using sample sd):\n")
print(tres)

