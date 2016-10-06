setwd("~/Desktop/bioestat/2016_2/dados")

#Carregar data.frame
andorinhas = read.csv("andorinhas.csv")

#Checar cabeçalho
head(andorinhas)

#Estatísticas descritivas

media = mean(andorinhas$peso)
dp = sd(andorinhas$peso)
cv = dp/media

#Calcular desvio padrão "manualmente"
dp2 = sqrt(var(andorinhas$peso))
dp == dp2

#teste-t com função do R
t.test(x = andorinhas$peso, alternative = "two.sided", mu = 12)

#teste-t usando R como calculadora
tobs = (mean(andorinhas$peso)-12)/(dp/sqrt(length(andorinhas$peso)))
tobs
pvalor = 2*pt(tobs, df = length(andorinhas$peso)-1, lower.tail=F)

####

#Subset do data.frame
machos = subset(andorinhas, andorinhas$sexo == "M")
femeas = subset(andorinhas, andorinhas$sexo == "F")

#Estatísticas exploratórias
mean(machos$peso)
sd(machos$peso)
mean(femeas$peso)
sd(femeas$peso)

#Teste-t duas pops
t.test(machos$peso, femeas$peso)

#Boxplot
boxplot(andorinhas$peso)

#Boxplot para cada gênero
boxplot(andorinhas$peso~andorinhas$sexo)

#Distribuição dos pesos das andorinhas (histograma)
hist(andorinhas$peso)
