docker run -it --rm -d -p 7700:7700 getmeili/meilisearch
wget https://docs.meilisearch.com/movies.json

curl \
  -X POST 'http://localhost:7700/indexes/movies/documents' \
  -H 'Content-Type: application/json' \
  --data-binary @movies.json

curl \
  -X PATCH 'http://localhost:7700/indexes/movies/settings' \
  -H 'Content-Type: application/json' \
  --data-binary '{
    "filterableAttributes": [
      "director",
      "genres"
    ]
  }'
 