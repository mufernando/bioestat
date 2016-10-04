### Comandos básicos no R voltados ao curso

# Voce pode copiar esse exercício para o R Studio (Control C + Control V) ou abrir direto no R Studio (File - Open File)

### A primeira coisa a se fazer é criar uma pasta para você armazenar todos os documentos
# usados e gerados ao longo deste curso (incluindo este script) 

### depois de criar a pasta para o curso, faca o seguinte:

getwd() # verifique o diretorio de trabalho atual

setwd() # se necessario, mude o diretorio de trabalho (para trabalhar dentro da sua pasta do curso)  

getwd() # verifique 

### Voce tambem tem a opcao de fazer isso utilizando a janela no canto inferior direito do RStudio,
# da seguinte forma: selecione a pasta que deseja, e na opcao More selecione Set As Working Directory

### Instale e carregue alguns pacotes

isntall.packages ("ggplot2") # instalando

require (ggplot2) # carregando

??ggplot2 # familiarize-se com o pacote
??car
# Pergunta: quando voce roda os dois comandos acima, o que vc acontece?


### Algumas operacoes aritimeticas basicas!

4 + 9
4 - 5
4 * 5
4 / 5
4^5
2^2
(4 + 5 ) * 7 - (36/18)^3
(4 + 5  * 7 - 36/18)^3
sqrt(9) # raiz quadrada
log( 10 ) # logaritmo natural ou neperiano
log( 10, base = 10) # logaritmo base 10
log10(10) # também logaritmo de base 10
exp (1) # exponencial

# Crie dois objetos, a e b, para as duas primeiras linhas acima (4+9 e 4-5). Faça a soma da diferença desses dois objetos, elevado ao quadrado.

#Resposta: 196

### Criação de Vetores
### Para criar um vetor, podemos usar a função c (c = colar, concatenar). Essa função
# simplesmente junta todos os argumentos dados a ela, formando um vetor: 

vector.a <- c(1, 10, 3.4, 16, 23, 91, 46 )
vector.b <- c(1, 10, 3.4, pi, pi/4, exp(-1), log( 2.23 ), sin(pi/7) )
vector.c <- c(6.1, 7.5, 7.0, 8.8, 9.1, 6.3)  

### Voce criou objetos. Onde vcs podem visualizá-lo no RStudio?
### Qual a classe desses objetos?
### Crie um vetor com 6 elementos da classe character. Dica use aspas
## Como vc apagaria esse vetor que acabou de criar? 

### Vetores: Operações Estatísticas
 # Faça a media do vetor.a, variancia do vetor.b, busque pelo maior valor do vetor.c e, por fim
 # faça o desvio padrão do vetor.a.
 # Dica! Use a funca help para pesquisar sobre essas operacoes:

?mean
help(mean)
?var
help(sd)


# Resposta:
#media = 27.2
#variancia = 10.6227
#maximo = 9.1
#desvio padrao = 31.92616

#Execute o comando abaixo e veja o help dessa funçao. O que ela fez?
 summary(vector.a)

### Vamos trabalhar com os Tipos de Objetos no R

### Vetor:

meu.vetor <- c(10.5,11.3,12.4,5.7)
meu.vetor
# coloque nomes para cada elemnto do meu.vetor. Dica: use a funçao names

# names(meu.vetor) <- c("a", "b", "c", "d")

# usando a indexacao busque apenas o segundo elemento do objeto meu.vetor. 
# Dica: usando colchetes vc pode buscar de duas formas. Apresente as duas.

### Matriz:

minha.matriz <- matrix(data=1:12,nrow=3,ncol=4)
minha.matriz

?matrix # olhe o help da funcao matrix
# Quais sao os argumentos da funcao matrix? 

#args(matrix) # olhe os argumentos da funcao matrix
#O que siginifica o argumento "byrow"?

# Crie um objeto minha.outra.matriz agora preenchendo as matrizes pelas linhas.


### Array:
my.array <- array(1:36, dim=c(3,4,3))
my.array

### Data frame:

nomes <- c("Didi","Dedé","Mussum","Zacarias")
ano.nasc <- c(1936,1936,1941,1934)
vive <- c("V","V","F","F")
trapalhoes <- data.frame(nomes,ano.nasc,vive)
trapalhoes


#execute o comando head e tail. Para o comando head, solicita as 10 primeiras linhas de trapalhoes.
# dica: olhe o help da funcao.
# Com qual funcao vc olharia a estrutura do objeto? Dica: pense na palavra em ingles e olhe no help. 

### Lista:
minha.lista <- list(um.vetor=1:5, uma.matriz=matrix(1:6,2,3), um.dframe=data.frame(seculo=c("XIX","XX","XXI"),inicio=c(1801,1901,2001)))
minha.lista
#abra o objeto minha.lista. Com qual funcao vc buscaria os nomes de cada parte da sua lista?
?list

### Funcoes basicas no R
#Execute a funçao que indica a classe dos objetos minha.lista, trapalhoes, my.array e minha.matriz



#execute essas funcoes e veja o que cada uma faz.
attributes(minha.lista) # atributo do objeto
attributes(trapalhoes) # atributo do objeto
attributes(my.array) # atributo do objeto
attributes(minha.matriz) # atributo do objeto

dim(my.array) # dimensões do objeto

nrow(minha.matriz) # numero de linhas 
ncol(minha.matriz) # número de colunas 

### Vamos trabalhar com um objeto do pacote datasets
### Ja instalamos e carregamos esse pacote na aula teorica
# entao, vamos lá:
# Com a funçao data carrega os dados do objeto iris

# Agora, abra o objeto iris

# Olhe o conteudo do objeto iris  

# Explore o objeto iris com e indique qual a classe do objeto, nomes das partes.


## Voce pode chamar o conteudo de uma coluna da seguinte maneira
iris$Sepal.Length
iris$Sepal.Width
iris$Species
#ou usando colchetes

# Agora, busque todas as linhas da coluna 3 do objeto minha.matriz.

# Agora, use colnames(minha.matriz) <- c("a", "b", "c", "d") para colocar nomes nas colunas da matriz. Abra o objeto minha.matriz de novo para conferir. Em seguida, busque as linhas 1 e 3, da coluna "d".


#Busque no objeto trapalhoes a sua classe. Em seguida, busque todas as linhas da coluna "nomes".
# Agora, busque a linha 4 de todas as colunas.

