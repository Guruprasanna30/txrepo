FROM node:alpine
WORKDIR /ei-emb
COPY ./pkg .
EXPOSE 3000
CMD ["node", "/root/server.js"]