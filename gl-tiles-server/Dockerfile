
FROM node:6-stretch
ENV NODE_ENV="production"
ENV PORT=3000

RUN apt-get -qq update \
    && DEBIAN_FRONTEND=noninteractive apt-get -y install \
    apt-transport-https \
    curl \
    unzip \
    build-essential \
    python \
    libcairo2-dev \
    libgles2-mesa-dev \
    libgbm-dev \
    libllvm3.9 \
    libprotobuf-dev \
    libxxf86vm-dev \
    xvfb \
    && apt-get clean

RUN apt-get install -y \
    software-properties-common \
    python-pip \
    libsqlite3-dev \
    zlib1g-dev

RUN git clone https://github.com/klokantech/tileserver-gl.git /usr/src/app \
    && cd /usr/src/app \
    && npm install --production \
    && npm link

RUN pip install awscli

RUN curl -sSL https://sdk.cloud.google.com | bash
RUN ln -f -s /root/google-cloud-sdk/bin/gsutil /usr/bin/gsutil

RUN git clone https://github.com/mapbox/tippecanoe.git \
    && cd tippecanoe \ 
    && make -j \
    && make install

RUN git clone https://github.com/tyrasd/osmtogeojson.git \
    && cd osmtogeojson \
    && npm install \
    && npm link

RUN apt-get install -y libz-dev zlib1g-dev
COPY ./start.sh .
CMD ./start.sh
