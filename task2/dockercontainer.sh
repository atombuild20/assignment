#!/bin/bash
docker run --rm -d -p 9200:9200 -p 9300:9300 --name elasticsearch -e "discovery.type=single-node" docker.elastic.co/elasticsearch/elasticsearch:6.6.1

#curl http://127.0.0.1:9200/_cat/health


