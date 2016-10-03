## Gerando dados para aula de anova

setwd('~/Desktop/bioestat/scripts/')

set.seed (4)

Ando.Amazonia.machos = round (rnorm(15, 5, 1),2)
Ando.Amazonia.femeas = round (rnorm(15, 10, 1),2)
Ando.Cerrado.machos = round (rnorm(15, 25, 1),2)
Ando.Cerrado.femeas = round (rnorm(15, 30, 1),2)
Ando.MataAtlantica.machos = round (rnorm(15, 12, 1),2)
Ando.MataAtlantica.femeas = round (rnorm(15, 8, 1),2)
massa.macho = round (rnorm(45, 17, 1),2)
massa.femea = round (rnorm(45, 13, 1),2)

andorinhas = data.frame (c(rep("AM",30), rep("CE",30),rep("MA",30)), c(Ando.Amazonia.machos, Ando.Amazonia.femeas, Ando.Cerrado.machos, Ando.Cerrado.femeas, Ando.MataAtlantica.machos, Ando.MataAtlantica.femeas), c(massa.macho,massa.femea), c(rep(c("M","F"),  each = 15), rep(c("M","F"),  each = 15), rep(c("M","F"),  each = 15)))
names(andorinhas) = c("subespecies", "asas", "peso", "sexo")
head(andorinhas)

write.csv (andorinhas, "andorinhas.csv", row.names=F)
