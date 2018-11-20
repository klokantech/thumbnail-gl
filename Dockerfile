FROM ubuntu:18.04 as build

RUN apt-get -qq update \
&& DEBIAN_FRONTEND=noninteractive apt-get -y install \
  curl git build-essential zlib1g-dev automake \
  libtool xutils-dev make pkg-config python-pip \
  libcurl4-openssl-dev libpng-dev libsqlite3-dev \
  libllvm3.9 libglfw3 libgles2-mesa-dev \
  libgbm-dev libxxf86vm-dev xvfb \
  libxi-dev libglu1-mesa-dev x11proto-randr-dev \
  x11proto-xext-dev libxrandr-dev \
  x11proto-xf86vidmode-dev libxxf86vm-dev \
  libxcursor-dev libxinerama-dev cmake ca-certificates

RUN curl -sL https://deb.nodesource.com/setup_8.x | bash && apt-get -yq install nodejs

RUN mkdir /build && cd /build && git clone https://github.com/mapbox/mapbox-gl-native.git \
  && cd /build/mapbox-gl-native \
  && git checkout 6bb1e977eafc61af39d47df083bb3de13205fae9\
  && export BUILDTYPE=Release && make render

FROM debian:stretch
VOLUME /data

RUN apt-get -qq update \
&& DEBIAN_FRONTEND=noninteractive apt-get -y install \
  libcurl4-openssl-dev \
  libgles2-mesa-dev libgbm-dev libxxf86vm-dev xvfb

COPY --from=build /build/mapbox-gl-native/build/linux-x86_64/Release/mbgl-render /usr/local/bin/mbgl-render
COPY --from=build /build/mapbox-gl-native/misc/ca-bundle.crt /usr/local/bin/ca-bundle.crt
COPY ./docker-entrypoint.sh /usr/local/bin/
COPY ./thumbnails.sh /usr/local/bin/
WORKDIR /usr/local/bin

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
