data("iris")
View(iris)
modelo = aov(iris$Sepal.Length~iris$Species)
modelo
summary(modelo)
pairwise.t.test(iris$Sepal.Length, iris$Species)

boxplot(iris$Sepal.Length~iris$Species)

iris_setosa = subset(iris, iris$Species=="setosa")

plot(iris_setosa$Sepal.Length~iris_setosa$Sepal.Width)

mod = lm(iris_setosa$Sepal.Length~iris_setosa$Sepal.Width)
summary(mod)
abline(mod, col="red")
