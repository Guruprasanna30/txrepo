FROM node:latest
COPY ./pkg /root
CMD ["node", "/root/server.js"]