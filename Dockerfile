FROM ubuntu:16.04


ENV http_proxy http://10.66.243.130:8080
ENV https_proxy https://10.66.243.130:8080

RUN  apt-get update \
  && apt-get install -y wget \
  && rm -rf /var/lib/apt/lists/*
RUN apt-get update && \
    apt-get install -y openjdk-8-jdk && \
    apt-get install -y ant && \
    apt-get clean;
RUN apt-get update && \
    apt-get install ca-certificates-java && \
    apt-get clean && \
    update-ca-certificates -f;
RUN apt-get install -y vim
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64/
RUN export JAVA_HOME


RUN wget -O /confluent.tar.gz http://packages.confluent.io/archive/5.2/confluent-community-5.2.2-2.12.tar.gz
RUN tar xfz confluent.tar.gz



WORKDIR /confluent-5.2.2/
COPY server_properties/ etc/kafka/





EXPOSE 9091 9092 2181 



