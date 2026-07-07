FROM nginx:alpine

WORKDIR /usr/share/nginx/html

COPY index.html
COPY script.js

ARG backend_url='ecs-loadbalancer-dns'

RUN sed -i "s|BACKEND_PLACEHOLDER|http://$${backend_url}|g" /usr/share/nginx/html/script.js

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]

