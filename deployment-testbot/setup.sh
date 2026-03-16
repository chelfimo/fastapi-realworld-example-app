#!/usr/bin/env bash
set -euo pipefail

#comment
cp .env.example .env
docker-compose up -d --build
