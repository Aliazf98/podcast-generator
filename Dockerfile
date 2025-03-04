# Use a specific version of Ubuntu (avoid 'latest')
FROM ubuntu:20.04

# Set non-interactive mode to avoid interactive prompts during apt-get
ARG DEBIAN_FRONTEND=noninteractive

# Install system dependencies and Python
RUN apt-get update && apt-get install -y \
    python3.10 \
    python3-pip \
    git \
    && rm -rf /var/lib/apt/lists/*  # Clean up to reduce image size

# Upgrade pip and install Python dependencies
RUN python3 -m pip install --upgrade pip && \
    python3 -m pip install pyyaml

# Copy your Python feed generator script into the container
COPY feed.py /usr/bin/feed.py

# Copy the entrypoint script into the container
COPY entrypoint.sh /entrypoint.sh

# Ensure entrypoint.sh has the right permissions
RUN chmod +x /entrypoint.sh

# Set the entrypoint to execute the shell script when the container starts
ENTRYPOINT ["/entrypoint.sh"]
