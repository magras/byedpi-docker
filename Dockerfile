FROM docker.io/alpine AS build
RUN apk add --no-cache build-base linux-headers
WORKDIR /usr/local/src/byedpi
COPY byedpi .
RUN make

FROM docker.io/alpine AS ciadpi
COPY --from=build /usr/local/src/byedpi/ciadpi /usr/local/bin/
RUN adduser -SH ciadpi
USER ciadpi
ENTRYPOINT ["ciadpi"]
