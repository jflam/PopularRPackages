# The caret package (short for Classification And REgression Training) is a set of functions 
# that attempt to streamline the process for creating predictive models. 
# The package contains tools for:
# 
# data splitting
# pre - processing
# feature selection
# model tuning using resampling
# variable importance estimation

# Visualization page (http://topepo.github.io/caret/visualizations.html)

str(iris)

# Scatterplot matrix
library(AppliedPredictiveModeling)
transparentTheme(trans = .4)

library(caret)
featurePlot(x = iris[, 1:4],
            y = iris$Species,
            plot = "pairs",
            ## Add a key at the top
auto.key = list(columns = 3))

# Scatterplot matrix with ellipses
featurePlot(x = iris[, 1:4],
            y = iris$Species,
            plot = "ellipse",
            ## Add a key at the top
auto.key = list(columns = 3))

# Overlayed density plots
transparentTheme(trans = .9)
featurePlot(x = iris[, 1:4],
                  y = iris$Species,
                  plot = "density",
                  ## Pass in options to xyplot() to 
                  ## make it prettier
                  scales = list(x = list(relation = "free"),
                                y = list(relation = "free")),
                  adjust = 1.5,
                  pch = "|",
                  layout = c(4, 1),
                  auto.key = list(columns = 3))

# Box plots

featurePlot(x = iris[, 1:4],
                  y = iris$Species,
                  plot = "box",
                  ## Pass in options to bwplot() 
scales = list(y = list(relation = "free"),
                                x = list(rot = 90)),
                  layout = c(4, 1),
                  auto.key = list(columns = 2))

# Scatter plots
library(mlbench)
data(BostonHousing)
regVar <- c("age", "lstat", "tax")
str(BostonHousing[, regVar])

theme1 <- trellis.par.get()
theme1$plot.symbol$col = rgb(.2, .2, .2, .4)
theme1$plot.symbol$pch = 16
theme1$plot.line$col = rgb(1, 0, 0, .7)
theme1$plot.line$lwd <- 2
trellis.par.set(theme1)
featurePlot(x = BostonHousing[, regVar],
            y = BostonHousing$medv,
            plot = "scatter",
            layout = c(3, 1))

# Plot lines
featurePlot(x = BostonHousing[, regVar],
            y = BostonHousing$medv,
            plot = "scatter",
            type = c("p", "smooth"),
            span = .5,
            layout = c(3, 1))


# Pre processing (http://topepo.github.io/caret/preprocess.html)

library(earth)
data(etitanic)
head(model.matrix(survived ~ ., data = etitanic))

dummies <- dummyVars(survived ~ ., data = etitanic)
head(predict(dummies, newdata = etitanic))

# Zero and near zero-variance predictors
data(mdrr)
data.frame(table(mdrrDescr$nR11))

nzv <- nearZeroVar(mdrrDescr, saveMetrics = TRUE)
nzv[nzv$nzv,][1:10,]

dim(mdrrDescr)

nzv <- nearZeroVar(mdrrDescr)
filteredDescr <- mdrrDescr[, - nzv]
dim(filteredDescr)

