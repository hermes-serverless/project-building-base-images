FROM nvidia/cuda:9.1-devel as base

LABEL builder-language="cuda"
LABEL version="1.0.0"

RUN apt-get install -y make \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /function

COPY . .

RUN make clean && make