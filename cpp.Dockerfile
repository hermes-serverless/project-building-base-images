FROM alpine as base

RUN apk add --no-cache make g++ bash python

WORKDIR /function

COPY . .

RUN make clean || (echo -e "\e[44m-> ERROR: The 'make clean' command failed. If it is a remove command a suggestion is to add a '-' right before the command. This way the makefile will ignore the error code\e[0m" && false)

RUN make

RUN wget -qO - https://raw.githubusercontent.com/hermes-tcc/project-building-base-images/master/validateFunction.sh | bash