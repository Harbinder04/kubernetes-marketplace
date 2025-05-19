#!/bin/bash

# Add the Meshery Helm repository
helm repo add meshery https://meshery.io/charts/

# Update your local Helm chart repository cache
helm repo update

# Install Meshery into the 'meshery' namespace
helm install meshery meshery/meshery --namespace meshery --create-namespace

# Wait for the Meshery pods to be in a running state
kubectl get pods -n meshery
echo "Waiting for Meshery pods to be in a running state..."
while [[ $(kubectl get pods -n meshery -o jsonpath='{.items[?(@.status.phase=="Running")].status.phase}') != "Running" ]]; do
    sleep 5
done
echo "Meshery pods are now running."

echo "Port forwarding Meshery service to localhost:9081..."
kubectl port-forward svc/meshery -n meshery 9081:9081

echo "You can access the Meshery application by opening your browser and visiting:"

echo "http://localhost:9081"