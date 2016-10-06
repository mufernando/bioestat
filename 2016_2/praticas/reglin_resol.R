setwd("~/Desktop/bioestat/2016_2/dados")

##### Alturas
altura = read.csv("altura.csv")

###Análise exploratória

summary(altura$filhos)

summary(altura$maes)

summary(altura$pais)

altura$mediapais = rowMeans(altura[,c(2,3)])

plot(altura$mediapais, altura$filhos)

cor(altura$filhos, altura$mediapais)

###Regressão linear
modelo = lm(filhos~mediapais, data=altura)

summary(modelo)

anova(modelo)

esperado = modelo$coefficients[[1]] + (modelo$coefficients[[2]] * 173)

plot(altura$mediapais, altura$filhos)
abline(modelo)

#Verificando premissas

res = resid(modelo)
hist(res)

plot(modelo)

##### Anscombe

data(anscombe)

c1 = cor(anscombe$x1, anscombe$y1)
c2 = cor(anscombe$x2, anscombe$y2)
c3 = cor(anscombe$x3, anscombe$y3)
c4 = cor(anscombe$x4, anscombe$y4)

c1
c2
c3
c4

m1 = lm(anscombe$y1~ anscombe$x1)
m2 = lm(anscombe$y2~ anscombe$x2)
m3 = lm(anscombe$y3~ anscombe$x3)
m4 = lm(anscombe$y4~ anscombe$x4)

summary(m1)
summary(m2)
summary(m3)
summary(m4)

plot(anscombe$y1~ anscombe$x1)
plot(anscombe$y2~ anscombe$x2)
plot(anscombe$y3~ anscombe$x3)
plot(anscombe$y4~ anscombe$x4)

plot(m1)
plot(m2)
plot(m3)
plot(m4)
