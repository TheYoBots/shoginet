FROM debian:stable AS builder

WORKDIR /shoginet

RUN apt update && apt install -y git build-essential clang

FROM python:3.10

WORKDIR /shoginet
COPY ./YaneuraOu-by-gcc /shoginet/YaneuraOu-by-gcc
COPY ./fishnet.ini /shoginet/fishnet.ini
COPY ./shoginet.py /shoginet/shoginet.py
COPY ./eval/nn.bin /shoginet/eval/nn.bin

RUN pip install requests

CMD ["python3", "shoginet.py"]
