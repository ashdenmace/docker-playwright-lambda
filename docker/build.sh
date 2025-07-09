#!/bin/bash
set -e
cd "$(dirname "$0")"

docker build -t playwright-lambda .
mkdir -p ../dist
docker run --rm -v "$PWD/../dist:/app" playwright-lambda




# chmod +x docker/build.sh
# ./docker/build.sh