FROM qdrant/qdrant:latest

WORKDIR /qdrant

# Copy startup script
COPY start.sh /start.sh
RUN chmod +x /start.sh

# Qdrant will use Railway's PORT variable
EXPOSE 6333

# Data will be persisted using Railway Volumes
# Mount point: /qdrant/storage

# Use startup script to set PORT dynamically
CMD ["/start.sh"]
