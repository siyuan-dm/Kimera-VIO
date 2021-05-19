#!/bin/bash

# Allow X server connection
xhost +local:root
docker run -it --rm \
    --gpus all \
    -e DISPLAY \
    -e NVIDIA_DRIVER_CAPABILITY=all \
    -e NVIDIA_VISIBLE_DEVICES=all \
    --env="DISPLAY" \
    --env="QT_X11_NO_MITSHM=1" \
    --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
    --privileged \
    kimera_vio
# Disallow X server connection
xhost -local:root
