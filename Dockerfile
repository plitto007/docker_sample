FROM ubuntu:16.04
LABEL key="ManhPV<manhterry93@gmail.com" 

ENV APP_PATH /venv/
WORKDIR ${APP_PATH}
# Update ubuntu
RUN apt-get update \
    && apt-get install -y wget

# Nginx
RUN apt-get install -y nginx

# Postgres SQL
RUN sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'\
    && wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add - \
    && apt-get install -y postgresql

COPY start.sh /venv/
# ADD  start.sh /venv

RUN chmod a+x /venv/*
ENTRYPOINT ["/venv/start.sh"]
EXPOSE 80