FROM quay.io/centos/centos:stream9-development

RUN dnf install -y java-17-openjdk-devel python3-pip gcc python3-devel postgresql-devel

ENV JAVA_HOME=/usr/lib/jvm/java-17-openjdk

RUN pip install -U pip \
    && pip install ansible-core \
    ansible-rulebook \
    ansible-runner \
    psycopg requests \
    && ansible-galaxy collection install kentik.ansible_eda community.docker

ARG APP_DIR=${APP_DIR:-/app}

WORKDIR $APP_DIR

RUN chmod -R 0775 $APP_DIR

