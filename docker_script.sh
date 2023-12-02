docker-compose -f docker-compose.yml up -d && echo 'hello1'
sleep 5 && echo 'hello2'
docker exec -it kafka /bin/sh -c "cd /opt/kafka/bin; kafka-topics.sh --create --topic ml-raw-dns --bootstrap-server localhost:9092" && echo 'hello3'
docker exec -it kafka /bin/sh -c "cd /opt/kafka/bin; kafka-topics.sh --create --topic ml-dns-predictions --bootstrap-server localhost:9092" && echo 'hello4'
