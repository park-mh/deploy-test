#!/bin/bash

export image_name=$(echo $IMAGE_NAME | cut -d':' -f1)
export image_tag=$(echo $IMAGE_NAME | cut -d':' -f2)
