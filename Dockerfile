FROM qdrant/qdrant:latest

# Qdrant runs on port 6333 by default
EXPOSE 6333

# Data persistence
VOLUME /qdrant/storage

# Default config
ENV QDRANT__SERVICE__HTTP_PORT=6333
ENV QDRANT__SERVICE__GRPC_PORT=6334
