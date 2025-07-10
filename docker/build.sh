#!/bin/bash
set -e

docker build -f docker/Dockerfile -t playwright-lambda .

mkdir -p dist

docker run --rm -v "$PWD/dist:/app" playwright-lambda
