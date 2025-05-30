# Builder Image

FROM python:3.12.8-slim-bookworm as builder

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      build-essential \
      libffi-dev \
      git && \
    apt-get clean -y

RUN mkdir -p /srv/docker-ansible

COPY requirements.txt /srv/docker-ansible/requirements.txt
COPY galaxy-requirements.yaml /srv/docker-ansible/galaxy-requirements.yaml

RUN python3 -m venv /srv/docker-ansible/env && \
  /srv/docker-ansible/env/bin/pip install -r /srv/docker-ansible/requirements.txt

# Final Image

FROM python:3.12.8-slim-bookworm

MAINTAINER New England Research Cloud (NERC) "https://nerc.mghpcc.org"

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      ssh \
      git \
    && apt-get clean -y

COPY --from=builder /srv/docker-ansible /srv/docker-ansible

COPY lint.sh /srv/docker-ansible/env/bin/lint.sh

RUN /srv/docker-ansible/env/bin/ansible-galaxy install -r /srv/docker-ansible/galaxy-requirements.yaml

ENTRYPOINT []

CMD ["/srv/docker-ansible/env/bin/ansible-playbook"]
