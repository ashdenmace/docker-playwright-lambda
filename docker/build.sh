#!/bin/bash
set -e

docker build -f docker/Dockerfile -t playwright-lambda .

mkdir -p terraform/dist

docker run --rm -v "$PWD/terraform/dist:/app" playwright-lambda