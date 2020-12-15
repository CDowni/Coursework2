FROM node:6.14.2
EXPOSE 8080 9000
COPY server.js .
CMD node server.js
