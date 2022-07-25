FROM node:12.0.0

RUN mkdir -p /seckillfont
WORKDIR /seckillfont
RUN chmod -R 777 /seckillfont
COPY . ./

RUN cp sources.list /etc/apt/
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y xdg-utils

RUN  npm install --registry=https://registry.npm.taobao.org
RUN chmod -R 777 /seckillfont
EXPOSE 8888

ENV HOST=0.0.0.0
ENV PORT=8888

USER node
CMD [ "npm", "run", "dev" ]
