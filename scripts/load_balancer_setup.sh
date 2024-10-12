#!/bin/bash

# Setup load balancer (AWS example using AWS CLI)

echo "Creating Load Balancer..."

# Create a target group for the instances
aws elbv2 create-target-group \
    --name mlops-target-group \
    --protocol HTTP \
    --port 5000 \
    --vpc-id YOUR_VPC_ID \
    --health-check-protocol HTTP \
    --health-check-path /predict \
    --target-type instance

# Create the load balancer
aws elbv2 create-load-balancer \
    --name mlops-load-balancer \
    --subnets YOUR_SUBNET_IDS \
    --security-groups YOUR_SECURITY_GROUP_ID

# Register instances with the target group
aws elbv2 register-targets \
    --target-group-arn YOUR_TARGET_GROUP_ARN \
    --targets Id=INSTANCE_ID_1 Id=INSTANCE_ID_2

# Create a listener
aws elbv2 create-listener \
    --load-balancer-arn YOUR_LOAD_BALANCER_ARN \
    --protocol HTTP \
    --port 80 \
    --default-actions Type=forward,TargetGroupArn=YOUR_TARGET_GROUP_ARN

echo "Load balancer setup complete."
