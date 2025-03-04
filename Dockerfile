FROM ubuntu: 20.04

RUN apt-get update && apt-get install -y \
    python3.10 \ 
    python3-pip \
    git

RUN python3 -m pip install --upgrade pip && python3 -m pip install pyyaml

COPY feed.py /usr/bin/feed.py

COPY entrypoint.sh /entrypoint.sh
# Ensure entrypoint.sh has the right permissions
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
