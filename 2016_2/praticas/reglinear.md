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

Lembrem-se que queremos saber se a altura dos dois pais influencia a altura dos filhos. Poderíamos realizar duas análises separadamente, uma investigando com a altura dos pais e outra das mães. No entanto, vamos seguir de uma maneira um pouco diferente. Vamos calcular a média da altura dos dois pais e utilizar essa nova variável como preditora nas análises subsequentes. Tente fazer isso sozinho (dica: utilize a função _rowMeans_) nomeando a nova coluna como _mediapais_.

Agora podemos, finalmente, fazer um gráfico de dispersão com a altura média dos dois pais no eixo X e a altura do filho no eixo Y. Utilize a função _plot_ para tal fim. Você diria que existe relação entre as variáveis?

Vamos quantificar a relação entre as duas variáveis, calculando o coeficiente de correlação linear. Interprete o coeficiente obtido.

```{r}
cor(altura$filhos, altura$mediapais)
```

## Regressão linear

Até agora conseguimos responder se há relação entre as duas variáveis e qual é a magnitude e o sentido dessa relação. Contudo, não conseguimos, dado um valor de X (média da altura dos pais) dizer qual seria o valor esperado de Y (altura do filho). Para isso, responder essa pergunta precisamos realizar uma análise de regressão linear.

Vamos começar aplicando um modelo linear nas variáveis utilizando a função _lm_. Note que existe uma notação especial para a fórmula do modelo linear do tipo _y~x_.

```{r}
modelo = lm(filhos~mediapais, data=altura)
```

Veja o sumário do seu modelo utilizando a função _summary_. Interprete todos os valores que são apresentados no output. Instale e carregue o pacote `car` no R. Agora, utilize a função _Anova_ para obter uma tabela de ANOVA para o modelo. Interprete os valores e tente descobrir a diferença entre _summary_ e _Anova_ (não se esqueça de usar a função _help_). Qual seria o valor esperado de altura do filho para um casal que tem como média de suas alturas o valor de 1,73? A hipótese nula da regressão foi rejeitada?

Plote novamente as variáveis preditora e resposta num diagrama de dispersão. Para adicionar a linha de tendência do modelo linear utilize a função _abline_ após fazer o diagrama.

```{r}
abline(modelo)
```

Vimos em aula que a análise de regressão linear possui algumas premissas, entre elas a normalidade dos resíduos e a homogeneidade das variâncias. Precisamos verificar se os resíduos aparentam ser normais e se há homogeneidade das variâncias para que nossas interpretações a respeito do modelo estejam corretas.

Para verificar a normalidade dos resíduos, podemos extrair todos os resíduos do modelo e salvar num novo vetor chamado `res = resid(modelo)`. Plote agora um histograma desse novo vetor. Você diria que os resíduos se distribuem normalmente?

Para checar a homogeneidade das variâncias podemos executar a função _plot_ no nosso modelo. Quatro gráficos aparecerão em sua tela, mas vamos focar apenas no primeiro. Parece haver alguma tendência nos resíduos? Existe mudança na variação dos resíduos a depender do valor ajustado de Y?

##Brincando com anscombe

O quarteto de Anscombe compreende quatro base de dados que possuem propriedades semelhantes no que se refere à correlação e regressão linear. Cada base de dados consiste de 11 pares de observação (x,y). Carregue essas bases de dados antes: `data(anscombe)`.

Comece calculando a correlação para cada par de variáveis (x1,y1), (x2, y2), etc. As correlações são semelhantes entre as bases de dados? (salve esses números em vetores nomeados de c1 à c4)

Agora realize uma análise de regressão linear para cada par de variáveis. Salve seus modelos em objetos nomeados de m1 à m4. Agora faça um _summary_ de cada modelo: os parâmetros estimados são semelhantes?

Segundo o que vimos ao longo desses dias, a análise exploratória é importantíssima, mas foi deixada de lado propositalmente nesse exercício. Não se deixe levar pelo tutorial sem pensar antes! Inspecione visualmente (plote um gráfico de dispersão) cada uma das bases de dados. O que você pode concluir com isso? Veja também os resíduos de cada modelo. Isso ajudaria você a perceber que tinha algo de diferente em cada base de dados?
