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

## Runtime environment variables

* `$multi__allow_explicit_index`  
  If this environment variable exists when the container starts, its value will overwrite
  [`rest.action.multi.allow_explicit_index`](https://www.elastic.co/guide/en/elasticsearch/reference/2.4/url-access-control.html#url-access-control).


## To build this image manually

```bash
docker build --tag livingdocs/elasticsearch .
```
