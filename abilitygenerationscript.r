set.seed(420)  # reproducibility

# === Ability Rolling Functions ===

roll_4d6_drop_lowest <- function() {
  rolls <- sample(1:6, 4, replace = TRUE)
  sum(sort(rolls, decreasing = TRUE)[1:3])
}

roll_3d6 <- function() {
  sum(sample(1:6, 3, replace = TRUE))
}

# === DMG Method Implementations ===

roll_method_I <- function() {
  sort(replicate(6, roll_4d6_drop_lowest()), decreasing = TRUE)
}

roll_method_II <- function() {
  best <- sort(replicate(6, roll_3d6()), decreasing = TRUE)
  for (i in 2:12) {
    candidate <- sort(replicate(6, roll_3d6()), decreasing = TRUE)
    if (sum(candidate) > sum(best)) best <- candidate
  }
  best
}

roll_method_III <- function() {
  sapply(1:6, function(i) max(replicate(6, roll_3d6())))
}

# === Class Qualification Functions ===

# For Methods I & II — assignable, so only values matter
qualifies_paladin_sorted <- function(stats) {
  sum(stats >= 12) >= 1 && sum(stats >= 9) >= 1 &&
    sum(stats >= 13) >= 1 && sum(stats >= 17) >= 1
}

qualifies_monk_sorted <- function(stats) {
  sum(stats >= 15) >= 3 && sum(stats >= 11) >= 1
}

# For Method III — position-locked stats
qualifies_paladin_fixed <- function(stats) {
  stats[1] >= 12 && stats[2] >= 9 && stats[3] >= 13 && stats[6] >= 17
}

qualifies_monk_fixed <- function(stats) {
  stats[1] >= 15 && stats[3] >= 15 && stats[4] >= 15 && stats[5] >= 11
}

# === Simulation Function ===

simulate_method <- function(method_fn, n = 10000, fixed = FALSE) {
  paladin <- 0
  monk <- 0
  for (i in 1:n) {
    stats <- method_fn()
    if (fixed) {
      if (qualifies_paladin_fixed(stats)) paladin <- paladin + 1
      if (qualifies_monk_fixed(stats)) monk <- monk + 1
    } else {
      if (qualifies_paladin_sorted(stats)) paladin <- paladin + 1
      if (qualifies_monk_sorted(stats)) monk <- monk + 1
    }
  }
  list(paladin_rate = paladin / n, monk_rate = monk / n)
}

# === Run Simulations ===

n_trials <- 10000

method_I_result <- simulate_method(roll_method_I, n = n_trials, fixed = FALSE)
method_II_result <- simulate_method(roll_method_II, n = n_trials, fixed = FALSE)
method_III_result <- simulate_method(roll_method_III, n = n_trials, fixed = TRUE)

# === Print Results ===

results <- data.frame(
  Method = c("Method I", "Method II", "Method III"),
  Paladin_Qualify = c(method_I_result$paladin_rate,
                      method_II_result$paladin_rate,
                      method_III_result$paladin_rate),
  Monk_Qualify = c(method_I_result$monk_rate,
                   method_II_result$monk_rate,
                   method_III_result$monk_rate)
)

print(results)

# === Optional Visualization ===

library(ggplot2)
library(tidyr)

results_long <- pivot_longer(results, cols = -Method, names_to = "Class", values_to = "Rate")

print(
  ggplot(results_long, aes(x = Method, y = Rate, fill = Class)) +
    geom_col(position = "dodge") +
    labs(title = "Qualification Rates by DMG Method",
         y = "Proportion Qualified",
         x = "Ability Score Generation Method") +
    theme_minimal()
)

