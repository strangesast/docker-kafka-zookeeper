FROM strangesast/docker-kafka-base

# for small memory
#ENV KAFKA_HEAP_OPTS="-Xmx256M -Xms128M"

ADD kafka/start-kafka.sh zookeeper/start-zookeeper.sh /usr/bin/
ADD kafka/server.properties .
ADD zookeeper/zookeeper.properties .

RUN chmod a+x /usr/bin/start-kafka.sh && \
    chmod a+x /usr/bin/start-zookeeper.sh

ADD supervisor/kafka.conf supervisor/zookeeper.conf /etc/supervisor/conf.d/

EXPOSE 2181 9092

CMD ["supervisord", "-n"]
