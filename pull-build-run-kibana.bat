REM https://www.elastic.co/guide/en/kibana/current/docker.html#run-kibana-on-docker-for-dev
docker pull docker.elastic.co/kibana/kibana:7.13.4
docker run -d --name kibana --net elasticsearch-kibana -p 5601:5601 -e "ELASTICSEARCH_HOSTS=http://elasticsearch-ltr:9200" docker.elastic.co/kibana/kibana:7.13.4
