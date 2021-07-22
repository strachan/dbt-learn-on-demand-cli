FROM python:3.7-slim-buster

WORKDIR /root

# Install system dependencies
RUN mkdir -p /root/.ssh && \
    apt-get update -yqq && \
    apt-get install -yqq --no-install-recommends \
    apt-utils \
    git \
    curl \
    ssh-client \
    build-essential \
    locales \
    unzip \
    less

# Upgrade pip
RUN python -m pip install --upgrade pip

# Install Python dependencies from requirements.txt
COPY ./requirements.txt /tmp/dbt/requirements.txt
RUN cd /tmp/dbt && pip install -r requirements.txt

ENTRYPOINT ["tail"]
CMD ["-f","/dev/null"]
