FROM nvidia/cuda:9.1-devel as base

RUN apt-get install -y make \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /function

COPY . .

RUN make