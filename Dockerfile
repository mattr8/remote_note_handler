FROM debian:bullseye-slim

RUN apt update && apt install -y \
    wget \
    gnupg \
    ca-certificates \
    jq \
    curl

RUN curl -s https://repos.azul.com/azul-repo.key | gpg --dearmor -o /usr/share/keyrings/azul.gpg \
    && echo "deb [signed-by=/usr/share/keyrings/azul.gpg] https://repos.azul.com/zulu/deb stable main" | tee /etc/apt/sources.list.d/zulu.list

RUN apt update && apt install -y \
    zulu24-jdk-headless \
    && rm -rf /var/lib/apt/lists/*

RUN wget https://github.com/hivemq/mqtt-cli/releases/download/v4.39.0/mqtt-cli-4.39.0.deb \
    && apt install ./mqtt-cli-4.39.0.deb

WORKDIR /app
RUN mkdir -p pending
COPY bin/ ./bin/
COPY .env .

RUN chmod +x ./bin/*
ENTRYPOINT [ "bash", "-c", "set -a && source .env && exec ./bin/subscribe" ]
