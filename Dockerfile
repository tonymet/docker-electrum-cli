FROM python:3-alpine
ENV ELECTRUM_VERSION 4.1.5
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
  SIG=Electrum-${ELECTRUM_VERSION}.tar.gz.ThomasV.asc; \
  FILE=Electrum-${ELECTRUM_VERSION}.tar.gz; \
  curl -sO https://download.electrum.org/${ELECTRUM_VERSION}/${SIG}; \
  curl -sO https://download.electrum.org/${ELECTRUM_VERSION}/${FILE}; \
  gpg --verify "${SIG}" "${FILE}"; \
  pip3 install pycryptodomex; \
  pip3 install --no-cache "${FILE}"; \
  # apk del .build-deps; \
  cd .. ; \
  rm -rf build .gnupg .cache; \
}

CMD /bin/sh
