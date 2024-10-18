FROM node:18-alpine

RUN npm install -g @mockoon/cli

WORKDIR /mockoon

COPY pecas-online-environment.json /mockoon/environment.json

EXPOSE 3000

CMD ["mockoon-cli", "start", "--data", "/mockoon/environment.json", "--daemon-off"]
