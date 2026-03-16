#!/usr/bin/env bash
set -euo pipefail

#comment
cp .env.example .env
docker compose up -d --build

# Wait for app to be ready
echo "Waiting for app to be ready..."
for i in $(seq 1 30); do
  if curl -sf http://localhost:8000/api/tags > /dev/null; then
    break
  fi
  sleep 2
done

# Register testbot user (ignored if already exists)
curl -sf -X POST http://localhost:8000/api/users \
  -H "Content-Type: application/json" \
  -d '{"user":{"username":"testbot","email":"testbot@example.com","password":"Testbot123!"}}' \
  > /dev/null 2>&1 || true
