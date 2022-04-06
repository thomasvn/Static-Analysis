# Tekton (cloud native CI/CD)

## Docker Desktop Setup

Follow instructions here: <https://docs.docker.com/desktop/kubernetes/>

```bash
kubectl config get-contexts
kubectl config use-context docker-desktop
kubectl get nodes
```

## K8s "Hello World"

Follow instructions here: <https://kubernetes.io/docs/tutorials/hello-minikube/>

```bash
# Deploy nginx
kubectl create deployment hello-node --image=k8s.gcr.io/echoserver:1.4
kubectl get all
kubectl get events

# Expose the service with a load balancer
kubectl expose deployment hello-node --type=LoadBalancer --port=8080

# View the k8s internals
kubectl get all -n kube-system

# Delete
kubectl delete service hello-node
kubectl delete deployment hello-node
```

## Tekton "Hello World"

Install following these instructions: <https://tekton.dev/docs/pipelines/install/>

```bash
kubectl apply --filename https://storage.googleapis.com/tekton-releases/pipeline/latest/release.yaml
```

"Hello World" following these instructions: <https://github.com/tektoncd/pipeline/blob/release-v0.33.x/docs/tutorial.md>

## References

- <https://tekton.dev>
- <https://docs.docker.com/desktop/kubernetes/>
- <https://kind.sigs.k8s.io/docs/design/initial/>

<!--
TODO:
- try a hello world on this cluster
- try installing operators?
-->