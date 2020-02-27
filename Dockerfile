FROM inutano/wget:latest as download
ENV LAST_BUILD=2020-02-27
RUN mkdir -p /data/
WORKDIR /data/

ARG URL_DOWNLOAD=http://download.geofabrik.de/south-america/brazil/sul-latest.osm.pbf
RUN wget -O latest.osm.pbf ${URL_DOWNLOAD}

FROM osrm/osrm-backend:latest as builder
MAINTAINER Like Sistemas <dev@likesistemas.com.br>

RUN mkdir -p /data/
COPY --from=download /data/latest.osm.pbf /data/latest.osm.pbf

RUN osrm-extract -p /opt/car.lua /data/latest.osm.pbf
RUN osrm-partition /data/latest.osrm
RUN osrm-customize /data/latest.osrm

FROM osrm/osrm-backend:latest
RUN mkdir -p /data/
COPY --from=builder /data/ /data/
CMD osrm-routed --algorithm mld /data/latest.osrm