### Anova no R

# Hoje iremos realizar a análise de variância no R. Vamos fazer um passo a passo como foi dado na aula teórica.
# Para começar, vamos voltar ao exemplo das andorinhas. Nós coletamos 90 indivíduos e medimos o comprimento da asa, a massa corporal e registramos o sexo. 
# Elas pertencem a três subspescies: uma que ocorre no bioma Amazônia, outra no Cerrado e a última da Mata Atlântica.

# Então, vamos começar! Inicialmente, carregue o arquivo "andorinhas.csv" em um objeto "andorinhas" e explore a planilha de dados e os tipos de variáveis presentes. Dica: use a função "read.csv", "head", "str". Antes, tenha certeza que está no diretório de trabalho correto.

andorinhas = read.csv("andorinhas.csv")
str()
head() 

# Sobre o R: 
  # 1) a função "head" apresenta as seis primeiras linhas de um data.frame (ou tabela, vetor, matrix...). Como você faria para ver as 10 primeiras linhas? Dica, veja o help da função. 

  # 2) Qual a classe do seu objeto?
  
  # Agora, vamos explorar os dados. Faça um boxplot da relaçao entre o comprimento das asas e  as subespecies presentes nos biomas Amazonia, Cerrado e Pantanal. Queremos avaliar o efeito da variável subespécie no comprimento da asa.  

  
boxplot(andorinhas$asas~andorinhas$subespecies)
# Novidade: antes de rodar o boxplot execute a funcao windows() e veja o que acontece!

# Qual é a variável dependente (resposta) e independente (preditora) avaliadas no boxplot acima?
# O boxplot indica um efeito da subespecie no comprimento da asa. Ok, mas será que essa diferença é real ou apenas um efeito do acaso?
# Vamos realizar a análise de variância para testar se o comprimento da asa para cada uma dessas subsespécies é diferente.
## Antes, descreva: qual a hipótese nula e a hipotése alternativa?


# Agora vamos começar a fazer a anova. Em outras palavras, vamos investigar o efeito de uma variável categórica (preditora) sobre a variação de uma variável contínua (resposta - y). Para isso, vamos produzir uma tabela de anova, como foi apresentada em sala de aula. Colocar frase sobre soma dos quadrados
# Inicialmente, vamos determinar a grande média

asas = data.frame (AM = andorinhas[1:30,2], CE=andorinhas[31:60,2], MA = andorinhas[61:90,2])
media.asas = apply (asas, 2, mean)
grande.media = mean(media.asas)
grande.media
##resposta: 15.08778

# Soma dos Quadrados Total (SQT)
## Uma estimativa de quanto o conjunto de dados (todos os grupos) varia em relacao à grande media.
## Somar a distancias dos dados de todos os grupos e a grande media, elevado ao quadrado

diff.total = asas - grande.media
diff.total

sum(diff.total)
##Voce achou esse resultado acima estranho? Vamos arrendondá-lo e veja o que acontece se arredondarmos para apenas duas casas decimais usando "round", abaixo. 
round (sum(diff.total)) # vai dar tudo zero. Por que?

#Continuando de maneira correta: 

diff.total.quad = diff.total^2
diff.total.quad
SQT = sum(diff.total.quad)
SQT # resposta: 7541.426

# Graus de liberdade da SQT: (m*n)-1 m [n de grupos] vezes n [de cada grupo = 30] - 1: (3 * 30) - 1 = 89

# Se eu dividir 7541.426 (SQT) por 89 vamos ter a variância para toda a amostra

# A soma dos quadrados total = SQ Dentro e SQ Entre os grupos
# Sabemos, agora, que a variacao total foi 7541.426. O quanto dessa variação se refere a variacao entre e dentro dos grupos?

# Próximo passo: Soma dos Quadrados Dentro dos grupos (SQD)
## Vamos somar as distâncias de cada medida de comprimento de asa para sua respectiva média (média de cada subespécie: AM, CE ou MA), elevado ao quadrado.  

asas # data.frame com os comprimentos de asas para cada subespecie
media.asas # média do comprimento da asa para cada subespécie

sq.asas.AM = sum((asas["AM"]-media.asas["AM"])^2)
sq.asas.AM
#agora continue:
sq.asas.CE = ### escreva os comnandos ###
sq.asas.CE

sq.asas.MA = ## escreva os comandos ###
sq.asas.MA

SQD = ### escreva os comandos (some os tres objetos criados acima)### 
SQD #600.0006
# Graus de liberdade: m(n-1) = 3(30 - 1): 3 * 29 = 87
# ou n total (90) - m (3) = 87


## De 7541.426 da variaçao total, 600.0006 se deve a soma dos quadrados dentro dos grupos. Esperamos, então que 6941.4254 sejam da variçao entre grupos.
# Proximo passo: Soma dos Quadrados Entre os grupos (SQE)
## Vamos estimar quanto dessa variação se deve a variação entre essas médias (grande media e media entre grupos).
## Para cada medida do comprimento da asa, vamos calcular a distância ao quadrado entre a média da subespécie e a média das médias.

media.asas # média do comprimento da asa para cada subespécie
grande.media #grande media

SQE.AM = 30*(media.asas["AM"] - grande.media)^2 # (por que 30 vezes aqui? Na aula foi explicado)
SQE.AM
#agora continue:
SQE.CE = ## escreva os comandos ###
SQE.CE
SQE.MA = ## escreva os comandos ###
SQE.MA
SQE = ### escreva os comandos (some os tres objetos criados acima)### 
SQE

# Ou, simplesmente (podemos fazer tudo em uma só linha!):
SQE_simples = sum(30*(media.asas - grande.media)^2)
SQE_simples + SQD #veja se o total é igual ao valor de SQT

# Graus de liberdade: (m- 1): 2


##Variação total (SQT) = variçao dentro dos grupos (SQD) + variaçao entre grupos (SQE). 
# Some os objetos SQD e SQE e confira o resultado com o valor do objeto SQT:
# Agora, some tambem os graus de liberdade de SQD e SQE e veja se é igual ao valor de gruas de liberdade de SQT 


# Calculo do F
# Vamos agora calcular a estatística F. Ela é definida como a razao entre SQE/g.l (desvio medio) e SDQ/g.l (desvio medio). 

mq.entre =  #escreva o comando (dica: SQE/g.l)#
mq.dentro =  #escreva o comando (dica: SQD/g.l)#
mq.entre
mq.dentro 
F.asas = # razao entre desvio medio entre e dentr
F.asas ##Resposta: 503.2529

# Cálculo do P
p.asas= pf(F.asas,2, 87, lower.tail=FALSE)
p.asas

#Pergunta: Vc rejeitou ou aceitou sua hipótese nula? As subespécies diferentes tem comprimentos de asas diferentes?

# Agora faça novamente a anova no R. Dessa vez, use a funçao aov e depois use o summary para verificar os resultados?
# Dica veja o help das funcoes e use o arquivo "andorinhas". Dica 2: no help da funcao aov o primeiro argumento usado chama-se "formula". Veja o boxplot que realizou no inicio deste exercicio. O primeiro argumento da funcao dele tambem é formula? Use essa dica para realizar a anova com aov.

# Para discussao: existe um efeito do sexo tambem? Faz sentido tesar o efeito de sexo separando por subespecie? ou com tudo junto?

