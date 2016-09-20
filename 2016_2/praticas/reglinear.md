#Regressão Linear no R

Estamos investigando se há relação entre a média da altura dos pais e a altura dos filhos. Para isso, vamos explorar graficamente, calcular a correlação linear e, por fim, realizaremos a regressão linear. Com isso, poderemos responder se há relação; qual a magnitude e o sentido da relação, e descobriremos qual é a função linear que melhor representa a relação entre essas duas variáveis.

##Entrando os dados

Vamos começar carregando os dados. Coletamos a altura dos seus pais e a altura de vocês no primeiro dia de aula e é com essa base de dados que trabalharemos. Baixe e salve a [planilha](/) em sua área de trabalho no R.

```{r}
altura = read.csv("altura.csv")
```

##Análise exploratória

Como temos três variáveis contínuas, podemos começar fazendo um sumário de cada uma das variáveis. Utilize a função _summary_.

```{r}
summary(altura$filhos) # Faça o mesmo pras outras variáveis que existem neste data.frame
```

Lembrem-se que queremos saber se a altura dos dois pais influencia a altura dos filhos. Poderíamos realizar duas análises separadamente, uma investigando com a altura dos pais e outra das mães. No entanto, vamos seguir de uma maneira um pouco diferente. Vamos calcular a média da altura dos dois pais e utilizar essa nova variável como preditora nas análises subsequentes. Tente fazer isso sozinho (dica: utilize a função _rowMeans_).

Agora podemos, finalmente, fazer um gráfico de dispersão com a altura média dos dois pais no eixo X e a altura do filho no eixo Y. Utilize a função _plot_ para tal fim. Você diria que existe relação entre as variáveis?

Vamos quantificar a relação entre as duas variáveis, calculando o coeficiente de correlação linear. Interprete o coeficiente obtido.

```{r}
cor(altura$filhos, altura$mediapais)
```

## Regressão linear
