FROM python:3.6-slim

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update; \
    apt-get install -y --no-install-recommends --no-install-suggests \
      qemu-system-i386 \
      qemu-utils; \
  pip install --no-cache-dir -U setuptools pip twine pipenv; \
  apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false; \
  rm -rf /var/lib/apt/lists/*

COPY images/*.qcow2 /opt/
