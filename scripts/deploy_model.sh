#!/bin/bash

# Deploy the machine learning model

echo "Building Docker image..."
docker build -t mlops-platform .

echo "Pushing Docker image to registry (optional, e.g., AWS ECR)..."
# docker tag mlops-platform:latest your-docker-repo/mlops-platform:latest
# docker push your-docker-repo/mlops-platform:latest

echo "Running Docker container..."
docker run -d -p 5000:5000 mlops-platform

echo "Model deployment complete. API is running at http://localhost:5000"
