FROM nginx

COPY index.html /usr/share/nginx/html/index.html
COPY nginx.conf /etc/nginx/nginx.conf
COPY image_info.sh /usr/share/nginx/html/image_info.sh
COPY env.sh /usr/share/nginx/html/env.sh

RUN chmod +x /usr/share/nginx/html/image_info.sh
RUN chmod +x /usr/share/nginx/html/env.sh

CMD ["/usr/share/nginx/html/image_info.sh"]
