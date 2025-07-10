FROM amazonlinux:2

RUN yum update -y && \
    yum install -y python3 tar gzip zip curl && \
    python3 -m ensurepip && \
    pip3 install --upgrade pip

RUN curl -LsSf https://astral.sh/uv/install.sh | sh && \
    mv ~/.local/bin/uv ~/.local/bin/uvx /usr/local/bin/

WORKDIR /app

COPY python/ ./python/

RUN mkdir -p package && \
    uv pip install playwright playwright_aws_lambda beautifulsoup4 --target package && \
    .local/bin/playwright install chromium && \
    cp -r python package/ && \
    cd package && zip -r /app/lambda.zip .

