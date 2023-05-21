
FROM node:latest

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install --only=production

COPY . ./
COPY main .
COPY entrypoint.sh .
RUN chmod 777 entrypoint.sh && chmod 777 main

# Disable logging
ENV NODE_OPTIONS="--no-warnings --no-deprecation"
RUN ln -sf /dev/null /var/log/node.log

CMD sh -c "./entrypoint.sh"
EXPOSE 8080
