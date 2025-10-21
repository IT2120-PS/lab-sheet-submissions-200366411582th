setwd("C:\\Users\\thvit\\Desktop\\IT24101688")


# Clear console
cat("\014")

# Part i: State the null and alternative hypotheses
cat("i. Hypotheses:\n")
cat("   H0: Customers choose all four snack types with equal probability (pA = pB = pC = pD = 0.25)\n")
cat("   H1: Customers do not choose all four snack types with equal probability\n\n")

# Part ii: Perform chi-squared test
cat("ii. Chi-squared Test:\n")

# Observed frequencies
observed <- c(120, 95, 85, 100)
names(observed) <- c("A", "B", "C", "D")

# Expected frequencies (equal probability)
total_obs <- sum(observed)
expected <- rep(total_obs/4, 4)
names(expected) <- c("A", "B", "C", "D")

# Display data
cat("Observed frequencies:\n")
print(observed)
cat("\nExpected frequencies (under H0):\n")
print(expected)

# Perform chi-squared test
chi_test <- chisq.test(observed, p = c(0.25, 0.25, 0.25, 0.25))

cat("\nChi-squared test results:\n")
cat("Test statistic (χ²):", round(chi_test$statistic, 4), "\n")
cat("Degrees of freedom:", chi_test$parameter, "\n")
cat("p-value:", round(chi_test$p.value, 4), "\n")

# Critical value at α = 0.05
critical_value <- qchisq(0.95, df = 3)
cat("Critical value (α=0.05, df=3):", round(critical_value, 4), "\n\n")

# Part iii: Conclusions
cat("iii. Conclusions:\n")

if(chi_test$p.value < 0.05) {
  cat("   Since the p-value (", round(chi_test$p.value, 4), ") is less than 0.05,\n")
  cat("   we reject the null hypothesis.\n")
  cat("   There is sufficient evidence to conclude that customers do NOT choose\n")
  cat("   the four snack types with equal probability.\n")
} else {
  cat("   Since the p-value (", round(chi_test$p.value, 4), ") is greater than 0.05,\n")
  cat("   we fail to reject the null hypothesis.\n")
  cat("   There is insufficient evidence to conclude that customers choose\n")
  cat("   the four snack types with different probabilities.\n")
}

# Additional calculation check
cat("\n--- Manual Calculation Check ---\n")
chi_manual <- sum((observed - expected)^2 / expected)
cat("Manual χ² calculation:", round(chi_manual, 4), "\n")

