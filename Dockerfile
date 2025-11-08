FROM qdrant/qdrant:latest

# Qdrant runs on port 6333 by default
EXPOSE 6333

# Default config - Railway will provide PORT env variable
ENV QDRANT__SERVICE__HTTP_PORT=${PORT:-6333}
ENV QDRANT__SERVICE__GRPC_PORT=6334

# Data will be persisted using Railway Volumes
# Mount point: /qdrant/storage
