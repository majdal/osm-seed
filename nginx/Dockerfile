FROM nginx:latest

COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 80

ENV SERVER_ROOT=127.0.0.1
ENV SERVER_PORT=80

CMD ["nginx", "-g", "daemon off;"]