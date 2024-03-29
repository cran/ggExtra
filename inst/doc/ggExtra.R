## ----setup, echo = FALSE, message = FALSE-------------------------------------
knitr::opts_chunk$set(tidy = FALSE, comment = "#>", fig.width = 6,
                      fig.height = 4, fig.align = "center")
# Encode the images into the document to make it self-contained (disabled
# because it looks like GitHub markdown doesn't suppport this)
#knitr::opts_knit$set(upload.fun = knitr::image_uri)

## ----load-pkg, warning=FALSE, message=FALSE-----------------------------------
library("ggExtra")
library("ggplot2")

## ----init-plot----------------------------------------------------------------
set.seed(30)
df1 <- data.frame(x = rnorm(500, 50, 10), y = runif(500, 0, 50))
p1 <- ggplot(df1, aes(x, y)) + geom_point() + theme_bw()
p1

## ----ggmarginal-basic---------------------------------------------------------
ggMarginal(p1)

## ----ggmarginal-large---------------------------------------------------------
ggMarginal(p1 + theme_bw(30) + ylab("Two\nlines"))

## ----ggmarginal-grouping, message=FALSE---------------------------------------
piris <- ggplot(iris, aes(Sepal.Length, Sepal.Width, colour = Species)) +
  geom_point()
ggMarginal(piris, groupColour = TRUE, groupFill = TRUE)

## ----ggmarginal-hist, message=FALSE-------------------------------------------
ggMarginal(p1, type = "histogram")

## ----ggmarginal-params, message=FALSE-----------------------------------------
ggMarginal(p1, margins = "x", size = 2, type = "histogram",
           col = "blue", fill = "orange")

## ----ggmarginal-extraparams---------------------------------------------------
ggMarginal(p1, type = "histogram", xparams = list(binwidth = 1, fill = "orange"))

## ----ggmarginal-save----------------------------------------------------------
p <- ggMarginal(p1)
p

## ----removeGrid---------------------------------------------------------------
df2 <- data.frame(x = 1:50, y = 1:50)
p2 <- ggplot2::ggplot(df2, ggplot2::aes(x, y)) + ggplot2::geom_point()
p2 + removeGrid()

## ----rotateTextX--------------------------------------------------------------
df3 <- data.frame(x = paste("Letter", LETTERS, sep = "_"),
                  y = seq_along(LETTERS))
p3 <- ggplot2::ggplot(df3, ggplot2::aes(x, y)) + ggplot2::geom_point()
p3 + rotateTextX()

## ----plotCount-table----------------------------------------------------------
plotCount(table(infert$education))

## ----plotCount-df-------------------------------------------------------------
df4 <- data.frame("vehicle" = c("bicycle", "car", "unicycle", "Boeing747"),
                  "NumWheels" = c(2, 4, 1, 16))
plotCount(df4) + removeGridX()

