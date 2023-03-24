FROM alpine:3.17.2

ARG IP_ADDRESS

ARG PORT

ARG PB_VERSION

ENV URL --http=${IP_ADDRESS}:${PORT}

RUN mkdir /pb

WORKDIR /pb

RUN apk add --no-cache \
    unzip \
    ca-certificates

ADD https://github.com/pocketbase/pocketbase/releases/download/v${PB_VERSION}/pocketbase_${PB_VERSION}_linux_amd64.zip /tmp/pb.zip

RUN unzip /tmp/pb.zip -d /pb/

EXPOSE ${PORT}

CMD /pb/pocketbase serve $URL