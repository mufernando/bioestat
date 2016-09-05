#Gerar dados andorinhas
setwd("~/Desktop/bioestat/2016_2/")
set.seed(1)
andorinhas_m = rnorm(50, mean = 17, sd = 1)
andorinhas_f = rnorm(50, mean = 13, sd = 1)
andorinhas = data.frame(c(andorinhas_m, andorinhas_f), c(rep("M",50), rep("F",50)))
names(andorinhas) = c("peso", "sexo")
mean(andorinhas$peso)
sd(andorinhas$peso)

write.csv(andorinhas, "andorinhas.csv", row.names=F)

t.test(andorinhas$peso, mu = 10)

machos = subset(andorinhas, andorinhas$sexo == "M")
femeas = subset(andorinhas, andorinhas$sexo == "F")
