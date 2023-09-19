#!/bin/bash

# Get the image name and tag
IMAGE_NAME=$(echo $HOSTNAME | cut -d '-' -f 1)
IMAGE_TAG=$(echo $HOSTNAME | cut -d '-' -f 2)

# Replace the placeholders in the index.html file with actual values
sed -i "s/\$image_name/$IMAGE_NAME/g" /usr/share/nginx/html/index.html
sed -i "s/\$image_tag/$IMAGE_TAG/g" /usr/share/nginx/html/index.html

# Start the Nginx server
nginx -g "daemon off;"
