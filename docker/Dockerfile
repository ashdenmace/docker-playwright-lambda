FROM amazonlinux:2

RUN yum update -y && \
    yum install -y python3 tar gzip zip curl && \
    python3 -m ensurepip && \
    pip3 install --upgrade pip

RUN curl -LsSf https://astral.sh/uv/install.sh | sh && \
    mv ~/.local/bin/uv ~/.local/bin/uvx /usr/local/bin/

WORKDIR /app

COPY python/ ./python/

RUN uv venv && \
    .venv/bin/uv pip install playwright playwright_aws_lambda beautifulsoup4 && \
    .venv/bin/playwright install chromium && \
    mkdir -p package && \
    cp -r .venv/lib/python3.*/site-packages/* package/ && \
    cp -r python package/ && \
    cd package && zip -r /app/lambda.zip .
