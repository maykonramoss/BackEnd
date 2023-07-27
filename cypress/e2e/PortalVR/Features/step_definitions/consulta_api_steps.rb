# features/step_definitions/consulta_api_steps.rb

# Importar a biblioteca HTTParty para realizar requisições HTTP
require 'httparty'

Dado('que acesso o endpoint de consulta da API') do
  # Faz uma requisição GET para a API e armazena a resposta na variável "@response"
  @response = HTTParty.get('https://portal.vr.com.br/api-web/comum/enumerations/VRPAT')
end

Quando('a resposta JSON é obtida') do
  # Converte o corpo da resposta em JSON e armazena na variável "@json_response"
  @json_response = JSON.parse(@response.body)
end

Então('a chave {string} deve estar presente no JSON') do |key|
  # Verifica se a chave especificada em "key" está presente no JSON "@json_response"
  expect(@json_response).to have_key(key)
end

Então('um tipo de estabelecimento aleatório deve ser impresso') do
  # Extrai os tipos de estabelecimento do JSON "@json_response" e armazena em "establishment_types"
  establishment_types = @json_response['typeOfEstablishment']

  # Seleciona aleatoriamente um tipo de estabelecimento da lista
  random_type = establishment_types.sample

  # Imprime o tipo de estabelecimento aleatório selecionado
  puts "Tipo de estabelecimento aleatórios: #{random_type}"
end
