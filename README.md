# README
## Dog Walking API

end points 

GET /v1/dog_walking # Retorna as dogs_walkings ?filter=1 a partir de hoje  ?filter=2 retorna todas
GET /v1/dog_walking/:id # Retorna o detalhe da dog_walking
POST /v1/dog_walking  # cria uma dogwalking
  Parameters
  {
	  "scheduled_date": "2019-10-15",
	  "duration": 30,
	  "longitude": "484898.884",
	  "latitude": "484898.884",
	  "person_id": 1,
	  "pets": [2]
  }

  PATCH /v1/dog_walking/:id/start_walking #Inicia uma dog_walking se esta criada

  PATCH /v1/dog_walking/:id/stop_walking #para uma dog_walking se esta iniciada

## configurar aplicação
 - clonar 
 - bundle install
 - rails db:create db:migrate

## Iniciar servidor

 - rails s

 ## run tests 
  - rspec -fd
  