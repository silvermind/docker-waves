FROM openjdk:jre

MAINTAINER Andrey Andreev <andyceo@yandex.ru> (@andyceo)

ENV WAVES_VERSION v0.3.3

EXPOSE 6869 6868

RUN apt-get update && \
  apt-get upgrade -y && \
  apt-get install -y --no-install-recommends ca-certificates && \
  apt-get autoclean && \
  curl -sL "https://github.com/wavesplatform/Waves/releases/download/${WAVES_VERSION}/waves-${WAVES_VERSION}-testnet-jar.tgz" | gunzip | tar -x && \
  mkdir /waves

VOLUME ["/waves"]

ENTRYPOINT ["java", "-jar", "/waves.jar", "waves-testnet.json"]
