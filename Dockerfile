FROM node:18-alpine

RUN npm install -g @mockoon/cli@8.4.0
COPY ./pecas-online-environment.json ./pecas-online-environment.json

# Install curl for healthcheck and tzdata for timezone support.
RUN apk --no-cache add curl tzdata

# Do not run as root.
RUN adduser --shell /bin/sh --disabled-password --gecos "" mockoon
RUN chown -R mockoon ./pecas-online-environment.json
USER mockoon

EXPOSE 3000

ENTRYPOINT ["mockoon-cli","start","--disable-log-to-file","--data","./pecas-online-environment.json","--port","3000"]

# Usage: docker run -p <host_port>:<container_port> mockoon-test