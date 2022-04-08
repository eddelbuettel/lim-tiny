
data <- getData()
expect_true(inherits(data, "data.frame"))
expect_true(NROW(data) > 100)

res <- dataSummary(data)
##expect_equal(dim(res), c(2,2))
expect_equal(NCOL(res), 2)
##expect_equal(res[,2], c(445, 55))
