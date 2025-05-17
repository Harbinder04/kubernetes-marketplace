#!/bin/bash

# Add the Meshery Helm repository
helm repo add meshery https://meshery.io/charts/

# Update your local Helm chart repository cache
helm repo update

# Install Meshery into the 'meshery' namespace
helm install meshery meshery/meshery --namespace meshery --create-namespace
