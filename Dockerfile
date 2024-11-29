# Use Alpine as the base image
FROM alpine:latest

# Install required packages
RUN apk add --no-cache python3 py3-pip python3-dev build-base bash

# Set the working directory
WORKDIR /app

# Copy the Python script to the container
COPY zigbee2mqtt_monitor.py /app/

# Create a virtual environment
RUN python3 -m venv /app/venv

# Install dependencies inside the virtual environment
RUN /app/venv/bin/pip install schedule requests docker paho-mqtt

# Set the command to run the script
CMD ["/app/venv/bin/python", "/app/zigbee2mqtt_monitor.py"]
