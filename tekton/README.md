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
# Core Tekton components
kubectl apply --filename https://storage.googleapis.com/tekton-releases/pipeline/latest/release.yaml
kubectl create configmap config-artifact-pvc \
    --from-literal=size=5Gi \
    --from-literal=storageClassName=hostpath \
    -o yaml -n tekton-pipelines \
    --dry-run=client | kubectl replace -f -

# CLI
brew install tektoncd-cli
```

["Hello World" for Tasks](https://tekton.dev/docs/getting-started/):

```bash
# Each STEP is executed with a container
# Steps are organized into TASKS within a pod
# Tasks are organized into PIPELINES
kubectl apply -f task-hello.yaml

# TASKRUN specifies runtime options for tasks
tkn task start hello --dry-run
tkn task start hello --dry-run > taskRun-hello.yaml
kubectl create -f taskRun-hello.yaml
```

["Hello World" for Pipelines](https://tekton.dev/docs/getting-started/pipelines/):

```bash
# Create a Pipeline resource with two Task resources
kubectl apply -f task-goodbye.yaml
kubectl apply -f pipeline-hello-goodbye.yaml

# Create a PipelineRun resource
tkn pipeline start hello-goodbye --dry-run > pipelineRun-hello-goodbye.yaml
kubectl create -f pipelineRun-hello-goodbye.yaml
```

## References

- <https://tekton.dev>
- <https://docs.docker.com/desktop/kubernetes/>
- <https://kind.sigs.k8s.io/docs/design/initial/>

<!--
TODO:
- try installing operators?
- <https://github.com/tektoncd/pipeline/blob/release-v0.33.x/docs/tutorial.md>
-->