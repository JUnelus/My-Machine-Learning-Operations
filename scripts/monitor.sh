#!/bin/bash

# Monitor system performance
echo "Monitoring system performance..."

# Monitor CPU usage
echo "CPU usage:"
top -b -n1 | grep "Cpu(s)"

# Monitor memory usage
echo "Memory usage:"
free -m

# Check logs for the running Docker container (mlops-platform)
echo "Fetching Docker logs..."
docker logs $(docker ps -q --filter ancestor=mlops-platform)

echo "Monitoring complete."
