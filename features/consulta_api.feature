# language: pt
Funcionalidade: Consulta de informações de estabelecimentos

Cenário: Verificar se a chave "typeOfEstablishment" está presente e imprimir um tipo de estabelecimento aleatoriamente
    Dado que acesso o endpoint de consulta da API
    Quando a resposta JSON é obtida
    Então a chave "typeOfEstablishment" deve estar presente no JSON.
    E um tipo de estabelecimento aleatório deve ser impresso
