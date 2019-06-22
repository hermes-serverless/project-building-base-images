FROM alpine as base

RUN apk add --no-cache make g++

WORKDIR /function

COPY . .

RUN make clean && make