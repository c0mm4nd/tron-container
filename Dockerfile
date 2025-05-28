# https://github.com/tronprotocol/java-tron?tab=readme-ov-file#running-java-tron
FROM eclipse-temurin:8-jre

ENV HEAP_SIZE=8g

COPY . /tron
WORKDIR /tron

EXPOSE 5555
EXPOSE 8090
EXPOSE 50051
EXPOSE 50545
EXPOSE 18888
EXPOSE 18888/udp
CMD ["sh", "start.sh"]
