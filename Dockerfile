FROM node:6-stretch as build

RUN apt-get -qq update \
&& DEBIAN_FRONTEND=noninteractive apt-get -y install \
   curl git build-essential zlib1g-dev automake \
   libtool xutils-dev make cmake pkg-config python-pip \
   libcurl4-openssl-dev libpng-dev libsqlite3-dev \
   libllvm3.9 libglfw3 libgles2-mesa-dev \
   libgbm-dev libxxf86vm-dev xvfb

RUN mkdir /build && cd /build && git clone https://github.com/mapbox/mapbox-gl-native.git
RUN cd /build/mapbox-gl-native && export BUILDTYPE=Release && make render

FROM debian:stretch
VOLUME /data
WORKDIR /data

RUN apt-get -qq update \
&& DEBIAN_FRONTEND=noninteractive apt-get -y install \
   libcurl4-openssl-dev \
   libgles2-mesa-dev libgbm-dev libxxf86vm-dev xvfb

COPY --from=build /build/mapbox-gl-native/build/linux-x86_64/Release/mbgl-render /usr/local/bin/mbgl-render
COPY --from=build /build/mapbox-gl-native/common/ca-bundle.crt /etc/ssl/certs/ca-bundle.crt
COPY ./docker-entrypoint.sh /usr/local/bin/
COPY ./thumbnails.sh /usr/local/bin
ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
