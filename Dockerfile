# Use Alpine OS as the base image
FROM alpine:latest

# Install required packages
RUN apk add --no-cache python3 py3-pip python3-dev build-base bash

# Set the working directory
WORKDIR /app

# Create a virtual environment
RUN python3 -m venv /app/venv

# Activate the virtual environment and install dependencies
RUN /app/venv/bin/pip install schedule requests docker paho-mqtt

# Activate the virtual environment on container startup
CMD ["/bin/bash"]
