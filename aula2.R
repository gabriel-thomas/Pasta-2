# classes de objetos e um pouco mais de lógica...  

# Referências 

# https://www.ibpad.com.br/blog/analise-de-dados/livros-para-se-aprender-r/
# http://leg.ufpr.br/~fernandomayer/aulas/ce083/computacao-cientifica.html. 
# http://adv-r.had.co.nz  <-- para Hacker 
# http://curso-r.github.io/posts/aula02.html <-- excelente para o 
# http://www.estatisticacomr.uff.br/?p=209 <-- lógica

# vamos aumentar a quantidade de dados nas atribuições? 
# para tanto introduziremos a função combine c 

exe <- c( 3 , 4 , 5 )
exe

# para saber a classe do número precisa utilizar a função class
# já levei surras históricas frente o R por causa da atribuiçào  
# automática de classes feita por ele

class( exe )

# numeric aceita números inteiros e decimais 

# se você inserir um número em decimal todos serào considerados decimais

exe <- c( 3.1 , 4 , 5 )
exe

class( exe )

# você também pode inserir caracteres 

exe_carac <- c( "introdução" , "ao" , "R")
exe_carac

class( exe_carac )


#######  classe para variáveis categóricas 

exe_cat <- factor( c("sim", "não", "sim", "sim", "não", "não" ))
exe_cat

class( exe_cat )

#######  cuidado com os espaços 

exe_cat <- factor( c("sim ", "não", "sim", "sim", "não", "não" ))
exe_cat

length(exe_cat) # retorna o tamanho do vetor

#### Tarefa 

### 1. Guarde em um objeto chamado nome uma string 
# contendo o seu nome completo.

### 2. Guarde em um objeto chamado cidade o nome da 
# cidade onde você mora. Em seguida, guarde em um objeto
#chamado estado o nome do estado onde você mora. 
# Usando esses objetos, resolva os itens abaixo:

# a. Utilize a função nchar() para contar o número 
# de caracteres em cada cada string.

# b. Interprete o resultado do seguinte código:

paste0(cidade, estado)
#concatena dois elementos

# c. Interprete o resultado do seguinte código:

paste(cidade, estado, sep = " - ")

# d. Desafio. Como você reproduziria o
#mesmo resultado do item (b) sem utilizar o argumento sep?

# e. Qual a diferença entre as funções paste() e paste0()?

#######  classe matriz 

matriz <- matrix(c(1, 2, 3, 4, 5, 6), nrow = 3,  ncol = 2) 
matriz
matriz_a <- matrix( 
  seq(1, 100), 
  ncol = 10,
  nrow = 10) 
matriz_a

### podemos criar uma matriz preenchendo primeiro as linhas 
# e depois as colunas. Para isso, 
# basta definirmos o argumento byrow = TRUE

matriz_b <- matrix( 
  seq(1, 100), 
  ncol = 10,
  nrow = 10,
  byrow = TRUE)
matriz_b

### cuidado com o R ... ele vai reaproveitar dados 

matriz_c <- matrix( 
  seq(1, 9), 
  ncol = 2,
  nrow = 5, byrow=TRUE)
matriz_c

#### Operações com matrizes
matriz_a * 10

### somar todos os elementos
sum(matriz_a)

### transposta
t(matriz_a)

### calcular o determinante
det(matriz_a)

### retorna elementos da diagonal principal
diag(matriz_a)

###  soma das linhas da matriz
rowSums(matriz_a)

###  média  das linhas da matriz
rowMeans(matriz_a)

### soma das colunas da matriz
colSums(matriz_a)

###  média  das colunas da matriz
colMeans(matriz_a)

##### tarefa

# Crie as matrizes
 
# A = | 1  2  4  |  e B = | 3  5  7 |
#     | 3  -1 2  |        | 0  4  8 |
#     | 6  -2 3  |        | 5  5  1 |

# crie as matrizes A e B e realize as seguintes operações:
  
# a) A+B
# b) A-B
# c) A*B

matriz_A<-matrix(c(1,2,4,3,-1,2,6,-2,3),ncol=3,nrow=3,byrow=TRUE)
matriz_A
matriz_B<-matrix(c(3,5,7,0,4,8,5,5,1),ncol=3,nrow=3,byrow=TRUE)
matriz_B
matriz_C<-matriz_A+matriz_B
matriz_C
matriz_D<-matriz_A-matriz_B
matriz_D
matriz_E<-matriz_A*matriz_B
matriz_E
matriz_F<-matriz_A%*%matriz_B
matriz_F

#O produto matricial é dado por %*%

####### classe matriz -- criar um banco mais elaborado 

resultado <- data.frame(
  numero_chamada = c(1,2,3,4),
  nomes = c("Cecília" , "Diogo", "Heitor", "João"),
  media = c(10, 3.4, 7.5, 7.5),
  resultado_final = c("APROVADO","REPROVADO","APROVADO","APROVADO")
)
resultado

dim(resultado) # retorna a dimensão do objeto
nrow(resultado) # retorna o número de linhas
ncol(resultado) # retorna o número de colunas

# se mudar o número de elementos em um vetor quebram tudo - teste 

# Ao invés de criar um dataframe diretamente com os dados, o correto é primeiramente 
# alocar o espaço (criar o dataframe) e depois disso ir adicionando os dados.

# Para saber qual é o tipo de um objeto, utilizamos a função typeof()

double <- c(1, 2.5, 4.5) 
typeof(double)

inteiros <- c(1L, 6L, 10L)
typeof(inteiros)

logico <- c(TRUE, FALSE, T, F)
typeof(logico)

caracter <- c("introdução", "ao R", "1")
typeof(caracter)

# quer testar se um objeto é de determinado tipo?
# is.integer(), is.double(), is.logical(), is.character() 

is.integer(inteiros)
is.integer(double)
is.double(inteiros)
is.double(double)

# o R sempre força para o tipo "mais flexível" - COERÇÃO

tipos <- c(1, "curso")
typeof(tipos)

tipos <- c(1, 3.5)
typeof(tipos)

tipos <- c(3.5, "curso")
typeof(tipos)

# acessar elementos em uma lista

exe
exe[2]

resultado
resultado[1,2]  # linha coluna

#### tarefa 

# Crie três vetores e depois "una" os três em um mesmo data frame. 
# por exemplo, últimas disciplinas cursadas, nome do professor, nota.

disciplinas<-c('Econometria I','Microeconomia III','Macroeconomia III')
professor<-c('Pedro Engel','Lucas Maestri','Bruno Delalibera')
nota<-c(1,2,3)
df<-data.frame(disciplinas,professor,nota)
df

##### fique atento

#### NaN quer dizer “Not a number”, ele aparece quando o resultado
# de uma expressão matemática não está definida.

#### NA significa “Not Available” e simboliza informação ausente/faltante.
# usamos NA principalmente para representar dados faltantes em bancos de dados.

#### NULL significa vazio, “nada”. Quando queremos que uma função não 
# retorne nada, fazemos ela devolver NULL.

### Inf representa o infinito, como no limite de funções matemáticas. 
# Valores muito grandes (10e+308) e 1/0 retornam Inf (com I maiúsculo).


#### Vamos sair do básico? 

######################################

#### Instalando Pacotes

# A principal fonte de pacotes R é o CRAN (The Comprehensive R Archive Network)
# Comunidade de desenvolvedores que mantem o R e os pacotes "oficiais".


install.packages("devtools")

#### chamando um pacote

library(devtools)

install_github("silvadenisson/electionsBR")

# importante pacote

install.packages("sos")

# chamando / abrindo o pacote 

library(sos)

library(brew)

# função 

findFn('correl')

# para animar https://rstudio.com/resources/cheatsheets/

# Folhas de Truques (Cheat Sheet)

#Funções:

fahrenheit_to_celsius <- function(tempF) {
  tempC <- (tempF-32)*5/9
  return(tempC)
}

celsius_to_fahrenheit <- function(tempC) {
  tempF <- (tempC*9/5)+32
  return(tempF)
}

#Função que retorna o tipo de triângulo dados os lados:

  #ERRADO:

triangle_type <- function(side1,side2,side3) {
 biggest_side <- max(side1,side2,side3)
 smallest_side <- min(side1,side2,side3)
 intermediate_side <- side1+side2+side3-biggest_side-smallest_side
 if(biggest_side<smallest_side+intermediate_side) {
   return('Impossible to create  triangle with the given sides') 
    } else if((side1==side2) & (side2==side3)) {
     return('The given sides form an equilateral triangle')
    } else if(((side1==side2) & (side2!=side3)) | ((side2==side3) & (side3!=side1))) {
     return('The given sides form an isosceles triangle')
    } else {
    return('The given sides form a scalene triangle')
  }
}

  #CERTO:

triangle_type2 <- function(side1,side2,side3) {
  sides <- c(side1,side2,side3)
  if ((side1+side2<side3)|(side1+side3<side2)|(side2+side3<side1)) {
    return('The given sides do not form a triangle')
  } else {
     if ((side1==side2)&(side2==side3)) {
        return('The given sides form an equilareal triangle')
    } else if (((side1==side2) & (side2!=side3)) | ((side2==side3) & (side3!=side1))) {
        return('The given sides form an isosceles triangle')
    } else if ((side1!=side2)&(side2!=side3)&(side1!=side3)) {
        return('The given sides form a scalene triangle')
    }
  }
}

#teste teste teste

soma <- function(a,b) {
  c <- a+b
  return(c)
}

#teste3 teste3
#teste4





