#!/bin/bash
#Maintainer = Dileep reddy
#Purpose = To delete the docker images except the latest one

# Get a list of all Docker images with their creation dates
image_list=$(docker images --format "{{.ID}} {{.CreatedAt}}" | sort -k2 -r)

# Extract the image ID and creation date of the latest image
latest_image=$(echo "$image_list" | head -n 1)
latest_image_id=$(echo "$latest_image" | awk '{print $1}')

# Iterate through the images and delete those that are not the latest
echo "$image_list" | while read -r image; do
    image_id=$(echo "$image" | awk '{print $1}')
    if [ "$image_id" != "$latest_image_id" ]; then
        echo "Deleting image: $image_id"
        docker rmi -f "$image_id"
    fi
done
