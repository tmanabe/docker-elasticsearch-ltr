FROM docker.elastic.co/elasticsearch/elasticsearch:7.13.4

ADD https://github.com/o19s/elasticsearch-learning-to-rank/releases/download/v1.5.7-es7.13.4/ltr-plugin-v1.5.7-es7.13.4.zip /tmp/
RUN bin/elasticsearch-plugin install --batch file:///tmp/ltr-plugin-v1.5.7-es7.13.4.zip

# For remote JVM debug and profiling
EXPOSE 5005
EXPOSE 7091
ENV ES_JAVA_OPTS -D "-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=*:5005 -XX:+FlightRecorder -Djava.rmi.server.hostname=0.0.0.0 -Dcom.sun.management.jmxremote.port=7091 -Dcom.sun.management.jmxremote.rmi.port=7091 -Dcom.sun.management.jmxremote -Dcom.sun.management.jmxremote.local.only=false -Dcom.sun.management.jmxremote.authenticate=false -Dcom.sun.management.jmxremote.ssl=false"
