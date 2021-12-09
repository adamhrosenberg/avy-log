# avy-log
to run mongo ```~/docker-compose up```
to run server: ```npm start```

to access mongo express: `localhost:8081`

to create log from curl:
```
curl --location --request POST 'localhost:3000/create' \
--header 'title: "test"' \
--header 'date: "11/2/10"' \
--header 'log: "test log"'
```

import collection via postman using:
`~/src/http/avy-log.postman_collection.json`