# Use Debian Bookworm slim as base
FROM python:3.11-slim-bookworm

# System deps for playwright (Chromium)
RUN apt-get update && apt-get install -y \
    curl unzip wget gnupg tar zip \
    libglib2.0-0 libnss3 libatk1.0-0 libatk-bridge2.0-0 \
    libx11-xcb1 libxcomposite1 libxdamage1 libxrandr2 \
    libxss1 libxtst6 libgbm1 libasound2 libpangocairo-1.0-0 \
    libgtk-3-0 libxshmfence1 ca-certificates fonts-liberation \
    && rm -rf /var/lib/apt/lists/*

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

