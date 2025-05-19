helm uninstall meshery -n meshery
kubectl delete namespace meshery
echo "Meshery has been uninstalled and the namespace has been deleted."
echo "You can verify the uninstallation by running:"
echo "kubectl get all -n meshery"