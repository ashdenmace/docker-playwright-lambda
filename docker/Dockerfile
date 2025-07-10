FROM amazonlinux:2

RUN yum update -y && \
    yum install -y python3 tar gzip zip curl git && \
    python3 -m ensurepip && \
    pip3 install --upgrade pip

RUN curl -LsSf https://astral.sh/uv/install.sh | sh && \
    mv ~/.local/bin/uv ~/.local/bin/uvx /usr/local/bin/

WORKDIR /app

COPY python/ ./python/

# Packages: 
#    - playwright 
#    - beautifulsoup4 
#    - playwright-aws-lambda 
RUN mkdir -p package && \
    uv pip install \
      playwright \
      beautifulsoup4 \
      git+https://github.com/JupiterOne/playwright-aws-lambda.git \
      --target package && \
    "$(dirname $(which uv))/playwright" install chromium && \
    cp -r python package/ && \
    cd package && zip -r /app/lambda.zip .

