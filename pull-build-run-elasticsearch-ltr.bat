REM https://www.elastic.co/guide/en/elasticsearch/reference/current/docker.html#_pulling_the_image
docker pull docker.elastic.co/elasticsearch/elasticsearch:7.13.4

REM Install the Elasticsearch Learning to Rank plugin
docker build -t elasticsearch-ltr:7.13.4 ./elasticsearch-ltr

REM https://www.elastic.co/guide/en/elasticsearch/reference/current/docker.html#docker-cli-run-dev-mode
REM For remote JVM debug and profiling are 5005 and 7091
docker run -d --name elasticsearch-ltr --net elasticsearch-kibana -p 5005:5005 -p 7091:7091 -p 9200:9200 -p 9300:9300 -e "discovery.type=single-node" elasticsearch-ltr:7.13.4
