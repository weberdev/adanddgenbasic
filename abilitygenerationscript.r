roll_4d6_drop_lowest <- function() {
  rolls <- sample(1:6, 4, replace = TRUE)
  sum(sort(rolls, decreasing = TRUE)[1:3])
}

roll_method_I <- function() {
  replicate(6, roll_4d6_drop_lowest())
}

roll_method_II <- function() {
  best <- NULL
  best_sum <- 0
  for (i in 1:12) {
    candidate <- replicate(6, sum(sample(1:6, 3, replace = TRUE)))
    if (sum(candidate) > best_sum) {
      best <- candidate
      best_sum <- sum(candidate)
    }
  }
  best
}

roll_method_III <- function() {
  replicate(6, sum(sample(1:6, 3, replace = TRUE)))
}

qualifies_paladin <- function(stats) {
  stats[1] >= 12 && stats[2] >= 9 && stats[3] >= 13 && stats[6] >= 17
}

qualifies_monk <- function(stats) {
  stats[1] >= 15 && stats[3] >= 15 && stats[4] >= 15 && stats[5] >= 11
}

simulate_method <- function(method, n = 10000) {
  paladin <- 0
  monk <- 0

  for (i in 1:n) {
    stats <- method()
    if (qualifies_paladin(stats)) paladin <- paladin + 1
    if (qualifies_monk(stats)) monk <- monk + 1
  }

  list(paladin_rate = paladin / n, monk_rate = monk / n)
}

set.seed(42)
method_I_result <- simulate_method(roll_method_I)
method_II_result <- simulate_method(roll_method_II)
method_III_result <- simulate_method(roll_method_III)


results <- data.frame(
  Method = c("Method I", "Method II", "Method III"),
  Paladin = c(method_I_result$paladin_rate,
              method_II_result$paladin_rate,
              method_III_result$paladin_rate),
  Monk = c(method_I_result$monk_rate,
           method_II_result$monk_rate,
           method_III_result$monk_rate)
)

print(results)

