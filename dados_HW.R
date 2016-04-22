#Gerar dados de HW
chr_1 = sample(rep(c("A","a"), each = 50),1000,replace=T)
chr_2 = sample(rep(c("A","a"), times=c(700,300)),1000)
dados = data.frame(chr_1, chr_2)

write.csv(dados, file="dados_HW.csv")

count_1 = table(dados$chr_1)
count_2 = table(dados$chr_2)
total = table(dados)
#Frequencia de a
p = (t_1[1]+t_2[1])/(t_1[1]+t_1[2]+t_2[1]+t_2[2])
q = 1-p
names(q) = "A"
esperado = c(p^2, 2*p*q, q^2)*length(dados$chr_1)
observado = c(total[1],total[2]+total[3],total[4])
desvios = ((esperado-observado)^2)/esperado
xsq = sum(desvios)
#número de classes - 1
gl = length(esperado)-1
pchisq(xsq, gl, lower.tail=F)
