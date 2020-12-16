FROM node:6.14.2
EXPOSE 8000
COPY Server.js .
CMD node Server.js
