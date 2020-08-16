FROM golang

COPY . .

ENV GOPATH=$PWD

ENV GOBIN=$GOPATH/bin

ENV REDIS_HOST="redis"

ENV REDIS_PORT="6379"

ENV REDIS_PASSWORD=""

ENV KAFKA_HOST="kafka"

ENV KAFKA_PORT="9092"

ENV KAFKA_TOPIC="number"

ENV KAFKA_CONSUMER_GROUP="numbers-group"

ENV HTTP_SERVER_PORT="8080"

ENV HTTP_SERVER_TIMEOUT="10000"

ENV GO111MODULE=on

RUN go mod download

RUN go install ./...

# RUN chmod +x start.sh

# RUN ./start.sh

ENTRYPOINT /bin/http-server

EXPOSE 8080