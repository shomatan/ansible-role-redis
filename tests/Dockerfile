FROM centos:7

RUN set -xe \
    && yum install -y epel-release \
    && yum install -y python-pip \
    && pip install pip --upgrade \
    && pip install ansible

WORKDIR /test

RUN printf '[defaults]\nroles_path=/test/roles' > ansible.cfg

COPY requirements.yml requirements.yml

RUN ansible-galaxy install -p roles -r requirements.yml