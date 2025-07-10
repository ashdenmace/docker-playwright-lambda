FROM amazonlinux:2

RUN yum update -y && \
    yum install -y python3 tar gzip zip git && \
    python3 -m venv /opt/venv && \
    /opt/venv/bin/pip install --upgrade pip

WORKDIR /app

COPY python/ ./python/

RUN /opt/venv/bin/pip install \
      playwright \
      playwright-aws-lambda \
      beautifulsoup4 && \
    /opt/venv/bin/playwright install chromium && \
    mkdir -p package && \
    cp -r /opt/venv/lib/python3.*/site-packages/* package/ && \
    cp -r python package/ && \
    cd package && zip -r /app/lambda.zip .

