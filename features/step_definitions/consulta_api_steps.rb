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

Então('a chave {string} deve estar presente no JSON.') do |key|
  # Verifica se a chave especificada em "key" está presente no JSON "@json_response"
  expect(@json_response).to have_key(key)
end

E ('um tipo de estabelecimento aleatório deve ser impresso') do
  # Verifica e imprime o estabelecimento"
  establishment_types = @json_response['typeOfEstablishment']
  random_type = establishment_types.sample
  puts "Tipo de estabelecimento aleatório: #{random_type}"
  expect(random_type).not_to be_nil
end
