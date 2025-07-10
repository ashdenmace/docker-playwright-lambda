FROM public.ecr.aws/lambda/python:3.11

RUN yum install -y curl git zip && \
    pip install --upgrade pip

RUN curl -LsSf https://astral.sh/uv/install.sh | sh && \
    mv ~/.local/bin/uv ~/.local/bin/uvx /usr/local/bin/

WORKDIR /app
COPY python/ ./python/

RUN mkdir -p package && \
    uv pip install \
      playwright==1.35.0 \
      beautifulsoup4 \
      --target package && \
    uvx playwright install chromium && \
    cp -r python package/ && \
    cd package && zip -r /app/lambda.zip .

