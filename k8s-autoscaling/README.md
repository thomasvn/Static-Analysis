# Autoscaling

## Prep

```bash
# Install
helm upgrade -i metrics-server metrics-server --repo https://kubernetes-sigs.github.io/metrics-server/ -n kube-system -f values-metrics-server.yaml

# Test
kubectl get --raw "/apis/metrics.k8s.io/v1beta1/nodes" | jq .
kubectl get --raw "/apis/metrics.k8s.io/v1beta1/pods" | jq .
```

## VPA

```bash
```
