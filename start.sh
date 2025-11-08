#!/bin/bash
set -e

# Use Railway's PORT or default to 6333
export QDRANT__SERVICE__HTTP_PORT=${PORT:-6333}
export QDRANT__SERVICE__GRPC_PORT=6334

echo "Starting Qdrant on HTTP port $QDRANT__SERVICE__HTTP_PORT"

# Start Qdrant
exec /qdrant/qdrant
