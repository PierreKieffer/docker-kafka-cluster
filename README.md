# docker-kafka-cluster
docker-kafka-ckuster allows to deploy a kafka multi node cluster (3 brokers, 1 zookeeper) with docker

https://medium.com/@PierreKieffer/deploy-a-kafka-multi-node-cluster-with-docker-72878ddbaf96

## Build the base image 
- clone the repo 
- `docker build -t kafka_base .`

## Launch the kafka cluster
- docker-compose up 

## Test
### Run a client 
- `docker run -it --network host kafka_base /bin/bash`
### Create a topic 
- `./bin/kafka-topics --create --zookeeper localhost:2181 --replication-factor 3 --partitions 3 --topic topic_name`
### Run a console producer 
- `./bin/kafka-console-producer --broker-list localhost:9091,localhost:9092,localhost:9093 --topic your_topic_name`

### Run a console consumer
- `./bin/kafka-console-consumer --topic your_topic_name --bootstrap-server localhost:9091,localhost:9092,localhost:9093`

### Monitoring consumer group  
- `./bin/kafka-consumer-groups --describe --group groupId --bootstrap-server localhost:9091,localhost:9092,localhost:9093`
