FROM python:3-alpine
ENV ELECTRUM_VERSION 4.1.2
WORKDIR /root
RUN mkdir build
COPY electrum-key.asc build
RUN { set -ex; \
  cd build; \
  apk update; \
  apk add --no-cache --virtual .build-deps gnupg curl gcc libc-dev linux-headers ; \
  # apk add jq py3-pycryptodomex; \
  apk add jq libsecp256k1; \
  gpg --import < electrum-key.asc; \
  curl -sO https://download.electrum.org/${ELECTRUM_VERSION}/Electrum-${ELECTRUM_VERSION}.tar.gz.asc; \
  curl -sO https://download.electrum.org/${ELECTRUM_VERSION}/Electrum-${ELECTRUM_VERSION}.tar.gz; \
  gpg --verify Electrum-${ELECTRUM_VERSION}.tar.gz.asc; \
  pip3 install pycryptodomex; \
  pip3 install --no-cache Electrum-${ELECTRUM_VERSION}.tar.gz; \
  # apk del .build-deps; \
  cd .. ; \
  rm -rf build .gnupg .cache; \
}

CMD /bin/sh
