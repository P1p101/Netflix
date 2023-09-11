library(FSA)
library(readxl)
library(sqldf)

dados <- read_excel("/Users/pietr/OneDrive/Documentos/pastinha/netflix.xlsx")

#1

#a
hist(dados$idade ~ dados$genero, col = 'royalblue')

#b
consulta_sql <- "SELECT inscricao, equipamento, COUNT(*) AS total, AVG(idade) AS med_idade, MIN(idade) AS idade_min, MAX(idade) AS idade_max FROM dados GROUP BY inscricao, equipamento"
estatisticas_equipamentos <- sqldf(consulta_sql)
print(estatisticas_equipamentos)

#2

#a
barplot(sort(table(dados$inscricao)), horiz = TRUE, col = 'darkcyan', main = 'Tipos de inscrições')

#b
(table(dados$inscricao))
prop.table(table(dados$inscricao)) * 100

#3

#a
boxplot(dados$idade ~ dados$inscricao, col = 'yellowgreen', main = 'Distribuição idade X tipo de inscrição')

#b
esta_desc <- by(dados$idade, dados$inscricao, FUN = summary)
print(esta_desc)

consulta_sql <- "SELECT inscricao, AVG(idade) AS media_idade, STDEV(idade) AS desvio_padrao_idade FROM dados GROUP BY inscricao"
resultados_sql <- sqldf(consulta_sql)
print(resultados_sql)

#4

#a
barplot(sort(table(dados$genero)), horiz = TRUE, col = 'rosybrown', main = 'Distribuição gênero X participante')

#b
(table(dados$genero))
prop.table(table(dados$genero)) * 100

#5

#a
boxplot(dados$idade ~ dados$equipamento, col = 'mediumslateblue', main = 'Idade X equipamento')

#b
esta_desc <- by(dados$idade, dados$equipamento, FUN = summary)
print(esta_desc)

consulta_sql <- "SELECT equipamento, AVG(idade) AS media_idade, STDEV(idade) AS desvio_padrao_idade FROM dados GROUP BY equipamento"
resultados_sql <- sqldf(consulta_sql)
print(resultados_sql)

#6
(table(dados$inscricao, dados$pais))
prop.table(table(dados$inscricao, dados$pais)) * 100

#7
hist(dados$idade ~ dados$pais, col = 'orchid')

#8
hist(dados$ano ~ dados$inscricao, col = 'lightcoral')

#9
(table(dados$idade, dados$genero))
prop.table(table(dados$idade, dados$genero)) * 100

#10
consulta_sql <- "SELECT inscricao, genero, COUNT(*) AS total FROM dados GROUP BY inscricao, genero"
resultados <- sqldf(consulta_sql)
print(resultados)

#11
(table(dados$equipamento, dados$inscricao))
prop.table(table(dados$equipamento, dados$inscricao)) * 100

#12
(table(dados$genero, dados$inscricao))
prop.table(table(dados$genero, dados$inscricao)) * 100

#13
consulta_sql <- "SELECT inscricao, equipamento, AVG(idade) AS med_idade, MIN(idade) AS idade_min, MAX(idade) AS idade_max, COUNT(idade) AS total FROM dados GROUP BY inscricao, equipamento"
resultados <- sqldf(consulta_sql)
print(resultados)

#14
(table(dados$ano, dados$inscricao))
prop.table(table(dados$ano, dados$inscricao)) * 100

#15
(table(dados$equipamento, dados$pais))
prop.table(table(dados$equipamento, dados$pais)) * 100

#16
consulta_sql <- "SELECT equipamento, AVG(idade) AS media_idade FROM dados GROUP BY equipamento"
media_idade_equipamento <- sqldf(consulta_sql)
print(media_idade_equipamento)

#17
consulta_sql <- "SELECT inscricao, pais, AVG(idade) AS méd_idade, MIN(idade) AS idade_min, MAX(idade) AS idade_max, COUNT(idade) AS total FROM dados GROUP BY inscricao, pais"
resultados <- sqldf(consulta_sql)
print(resultados)

#18
consulta_sql <- "SELECT inscricao, equipamento, COUNT(*) AS total FROM dados GROUP BY inscricao, equipamento"
resultados <- sqldf(consulta_sql)
print(resultados)
