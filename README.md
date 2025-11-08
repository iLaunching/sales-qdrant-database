# Qdrant Vector Database Service

Vector database for semantic search in the Sales API system.

## What Does This Do?

Stores and searches sales content using AI embeddings:
- Pitch templates
- Success stories
- Product features
- Objection responses
- Value propositions

## Deploy to Railway

```bash
# Push to GitHub
git init
git add .
git commit -m "Add Qdrant service"
git remote add origin https://github.com/iLaunching/qdrant-service.git
git push -u origin main

# In Railway dashboard:
1. Click "+ New"
2. Select "GitHub Repo"
3. Choose "qdrant-service"
4. Deploy

# Get the URL
Railway provides: https://qdrant-service-production-XXXX.up.railway.app
```

## Configure Sales API

Add to Sales API environment variables:
```bash
QDRANT_ENABLED=true
QDRANT_URL=https://qdrant-service-production-XXXX.up.railway.app
QDRANT_API_KEY=  # Optional, leave blank for now
```

## Initial Data Load

Once deployed, populate with sales content:

```python
# Run this script to load initial data
import requests
from openai import OpenAI

client = OpenAI()
qdrant_url = "https://your-qdrant.railway.app"

# Create collection
requests.put(
    f"{qdrant_url}/collections/pitch_templates",
    json={
        "vectors": {
            "size": 1536,  # OpenAI embedding size
            "distance": "Cosine"
        }
    }
)

# Add pitch template
pitch = "For fast-growing tech companies struggling with manual competitor analysis..."
embedding = client.embeddings.create(
    input=pitch,
    model="text-embedding-3-small"
).data[0].embedding

requests.put(
    f"{qdrant_url}/collections/pitch_templates/points",
    json={
        "points": [
            {
                "id": 1,
                "vector": embedding,
                "payload": {
                    "text": pitch,
                    "industry": "technology",
                    "pain_point": "manual analysis"
                }
            }
        ]
    }
)
```

## Cost

- Railway: ~$5/month for basic usage
- Storage: Grows with number of templates/stories stored
- Alternative: Qdrant Cloud (free tier available)

## Do You Need This Now?

**NO - It's optional for Phase 1!**

Current setup already works with placeholder data. Add Qdrant later when you want:
- Semantic search instead of keyword matching
- Hundreds/thousands of sales templates
- Real customer data analysis
- A/B testing different pitches
