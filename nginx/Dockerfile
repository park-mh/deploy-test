FROM nginx

RUN apt-get update && \
    apt-get install -y nginx-module-njs && \
    rm -rf /var/lib/apt/lists/*

COPY nginx.conf /etc/nginx/nginx.conf
COPY index.html /usr/share/nginx/html/index.html

CMD ["nginx", "-g", "daemon off;"]
