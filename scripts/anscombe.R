data(anscombe)
#Primeiramente, vamos calcular as correlações entre essas variáveis
cor(anscombe$x1, anscombe$y1)
cor(anscombe$x2, anscombe$y2)
cor(anscombe$x3, anscombe$y3)
cor(anscombe$x4, anscombe$y4)

#Outra maneira de fazer exatamente a mesma coisa:
with(anscombe, cor(x1, y1, method="spearman"))
with(anscombe, cor(x2, y2, method="spearman"))
with(anscombe, cor(x3, y3, method="spearman"))
with(anscombe, cor(x4, y4, method="spearman"))

#Agora, vamos plotar os gráficos para verificar a importância da
#ANÁLISE EXPLORATÓRIA
par(mfrow = c(2,2))
with(anscombe, plot(x1, y1))
with(anscombe, plot(x2, y2))
with(anscombe, plot(x3, y3))
with(anscombe, plot(x4, y4))
mtext("Anscombe's 4 Regression data sets", outer = TRUE, cex = 1.5)
