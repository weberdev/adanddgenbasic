roll_4d6_drop_lowest <- function() {
  rolls <- sample(1:6, 4, replace = TRUE)
  sum(sort(rolls, decreasing = TRUE)[1:3])
}

3d6