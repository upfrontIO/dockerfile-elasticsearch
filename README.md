# Elasticsearch

The Elasticsearch setup we at Livingdocs currently use in development


## Create a container and give it a name

```bash
docker run -p 9200:9200 -p 9300:9300 --name elasticsearch livingdocs/elasticsearch
```

## Start an existing container

```bash
docker start elasticsearch
```


## To build this image manually

```bash
docker build --tag livingdocs/elasticsearch .
```
