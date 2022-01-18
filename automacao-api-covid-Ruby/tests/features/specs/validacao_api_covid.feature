#language: pt
@Covid
Funcionalidade: Retornar total de número de casos do Covid19 de um país em específico
Como um usuário do sistema
Eu quero realizar as requisições na API
Para verificar as informações dos casos de Covid19 no Brasil

Cenario: Retornar o total de número de casos do Covid19 no Brasil
Dado o endereço da API para consultar o número de casos do Covid19 de um país específico
Quando realizar uma requisição com parâmetro de busca: Brasil
Então a API irá retornar os dados dos números de casos do Covid19 no Brasil respondendo o código 200