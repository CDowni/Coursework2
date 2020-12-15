FROM nginx:latest

COPY Server.js /usr/share/nginx/js

EXPOSE 80 443 	

CMD ["nginx", "-g", "daemon off;"]
