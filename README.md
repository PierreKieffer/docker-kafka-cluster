# docker-kafka-cluster
docker-kafka-ckuster allows to deploy a kafka multi node cluster (3 brokers, 1 zookeeper) with docker

## Build the base image 
- clone the repo 
- docker build -t kafka_base .

## Launch the kafka cluster
- docker-compose up 

## Test
### Run a console producer 
- docker run -it --network host kafka_base /bin/bash
- ./bin/kafka-console-producer --broker-list localhost:9091,localhost:9092,localhost:9093 --topic your_topic_name

### Run a console consumer
- ./bin/kafka-console-consumer --topic your_topic_name --bootstrap-server localhost:9091,localhost:9092,localhost:9093
