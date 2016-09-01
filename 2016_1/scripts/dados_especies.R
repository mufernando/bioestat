sp_a = jitter(rnorm(100, mean = 10, sd = 12))
sp_b = jitter(rnorm(100, mean = 14, sd = 5))
sp_c = rnorm(100, mean = 30, sd = 15) + rnorm(100, mean = 40, sd = 20)/40
especie = as.factor(rep(c("A", "B", "C"), each = 100))
medidas = c(sp_a,sp_b,sp_c)
dados = data.frame(especie, medidas)

write.csv(dados, file="dados_spp.csv")

boxplot(sp_a, sp_b, sp_c)
summary(aov(medidas~especie))
pairwise.t.test(medidas, especie, p.adjust.method="bonferroni")
library(RcmdrMisc)
plotMeans(medidas, especie, err="conf.int")
#como calcular intervalos de confianca?
