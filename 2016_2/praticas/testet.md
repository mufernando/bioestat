#Teste-t no R

A pergunta que nos propusemos a responder em aula foi de quanto pesa uma
andorinha. Para isso, fomos à campo, coletamos e pesamos 100 indivíduos. Os
dados obtidos foram tabulados e se encontram nesta [planilha](andorinhas.csv).

###Entrando os dados

Vamos começar carregando os dados da planilha no R. Para isso, use a função
_read.csv_. Execute o comando `help(read.csv)` caso seja necessário.

Para que sua planilha fique salva e você possa utilizá-la inúmeras vezes, você
deve atribuir a leitura do .csv para um objeto. Exemplo:

```{r}
andorinhas = read.csv("andorinhas.csv")
```

Note que para esse comando funcionar você deve ter ajustado seu diretório de
trabalho para o diretório onde o arquivo se encontra. Utilize a função _setwd_
para esse fim.

###Calculando medidas de tendência central e variabilidade

Primeiramente, vamos dar uma olhada geral nos dados utilizando o comando _head_.
 Agora que você já sabe a estrutura do seu _data.frame_ podemos prosseguir.
 Podemos calcular a média usando a função _mean_, a variância com _var_ e o
 desvio padrão com _sd_ ou tirando a raíz quadrada da variância com _sqrt_. Note
  que nosso _data.frame_ possui duas colunas, mas o que nos interessa no momento
  é apenas a coluna __peso__. Uma maneira de extrair apenas essa coluna é
  utilizando _$_:

```{r}
andorinhas$pesos #imprime o vetor dos pesamos
media = mean(andorinhas$pesos) # calcula a média dos pesos e atribui à variável média
dp = sd(andorinhas$pesos) # calcula o desvio padrão e atribui à variável dp
cv = dp/media # calcula o coeficiente de variação e atribui à variável cv
```

Tente calcular o desvio padrão tirando a raíz quadrada da variância e salve num
objeto chamado `dp2`. Agora execute o comando abaixo e interprete-o:

```{r}
dp == dp2
```

Qual foi o resultado? As duas maneiras de calcular o desvio padrão são
equivalentes? O que o operador `==` faz?

###Explorando graficamente
