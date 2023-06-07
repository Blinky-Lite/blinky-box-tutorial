FROM nodered/node-red:3.0.2-16
USER root
RUN apk add --no-cache curl
COPY html-static/       /data/html-static/
COPY flows.json         /data/flows.json
COPY flows_cred.json    /data/flows_cred.json
COPY settings.js        /data/settings.js
WORKDIR /usr/src/node-red
RUN npm install node-red-dashboard@3.4.0
RUN npm install node-red-contrib-auth@0.1.7
RUN npm install node-red-contrib-bcrypt@0.1.6
RUN npm install node-red-contrib-mongodb3@2.0.1
RUN npm install node-red-contrib-nexmo@3.3.1
RUN npm install otplib@12.0.1
RUN npm install qrcode@1.5.1
ENV MQTTCLIENTID=blinky-lite-box
ENV MQTTSERVERIP=blinky-box-docker-mosquitto-1
ENV MQTTUSERNAME=blinky-lite
ENV BOX=blinky-lite-box
ENV SUBSCRIBETOPIC="blinky-lite-box/+/+/#"
ENV IPREFWEB="https://www.blinky-lite.se"
ENV NODEREDLABEL=blinky-lite-box
ENV ENABLE_NODERED_EDITOR=0
ENV NODEREDPORT=60427
ENV HTMLSTATIC=/data/html-static
ENV DATADIR=/data/mqtt-auth
ENV BOXUSER=blinky-lite
USER node-red