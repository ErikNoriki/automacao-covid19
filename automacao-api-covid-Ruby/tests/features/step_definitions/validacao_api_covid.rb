Dado('o endereço da API para consultar o número de casos do Covid19 de um país específico') do
    #Url base da API Covid
    $uri_base = "https://corona.lmao.ninja/v3/covid-19/countries"
end
  
Quando('realizar uma requisição com parâmetro de busca: Brasil') do
    #Insere parâmetro de busca 'Brasil' na Url base
    $response = HTTParty.get($uri_base + '/Brazil')
end
  
Então('a API irá retornar os dados dos números de casos do Covid19 no Brasil respondendo o código {int}') do |int|
    #Valida se a resposta do status code da API é 200
    puts "Response code: #{$response.code}"
    expect($response.code).to eq 200
    #Valida se a resposta da API está em formato JSON
    expect($response.content_type).to eq('application/json')
    #Visualiza o retorno da API
    puts "Response body: #{$response.inspect}"
    #Valida se o país buscado é o Brasil
    expect($response.parsed_response['country']).to eq 'Brazil'
    expect($response.parsed_response['countryInfo']['_id']).to eq 76
    expect($response.parsed_response['countryInfo']['iso2']).to eq 'BR'
    expect($response.parsed_response['countryInfo']['iso3']).to eq 'BRA'
    expect($response.parsed_response['countryInfo']['lat']).to eq -10
    expect($response.parsed_response['countryInfo']['long']).to eq -55
    expect($response.parsed_response['countryInfo']['flag']).to eq 'https://disease.sh/assets/img/flags/br.png'
    #Valida o body da API verificando se não retorna vazio ou nulo
    expect($response.parsed_response['cases']).not_to be_nil
    expect($response.parsed_response['todayCases']).not_to be_nil
    expect($response.parsed_response['deaths']).not_to be_nil
    expect($response.parsed_response['todayDeaths']).not_to be_nil
    expect($response.parsed_response['recovered']).not_to be_nil
    expect($response.parsed_response['todayRecovered']).not_to be_nil
    expect($response.parsed_response['active']).not_to be_nil
    expect($response.parsed_response['critical']).not_to be_nil
    expect($response.parsed_response['casesPerOneMillion']).not_to be_nil
    expect($response.parsed_response['deathsPerOneMillion']).not_to be_nil
    expect($response.parsed_response['tests']).not_to be_nil
    expect($response.parsed_response['testsPerOneMillion']).not_to be_nil
    expect($response.parsed_response['population']).not_to be_nil
    expect($response.parsed_response['continent']).not_to be_nil
    expect($response.parsed_response['oneCasePerPeople']).not_to be_nil
    expect($response.parsed_response['oneDeathPerPeople']).not_to be_nil
    expect($response.parsed_response['oneTestPerPeople']).not_to be_nil
    expect($response.parsed_response['activePerOneMillion']).not_to be_nil
    expect($response.parsed_response['recoveredPerOneMillion']).not_to be_nil
    expect($response.parsed_response['criticalPerOneMillion']).not_to be_nil
    #Valida o corpo schema da API se é JSON
    expect($response.parsed_response).to match_json_schema('covid')
end