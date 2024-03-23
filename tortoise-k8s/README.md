# Tortoise K8s Autoscaler

<https://github.com/mercari/tortoise/>

## Setup

```sh
git clone org-8133808@github.com:mercari/tortoise.git
cd tortoise
make install
make deploy
```

<!-- 
$ minikube start
😄  minikube v1.32.0 on Darwin 14.0 (arm64)
✨  Automatically selected the docker driver. Other choices: virtualbox, ssh
📌  Using Docker Desktop driver with root privileges
👍  Starting control plane node minikube in cluster minikube
🚜  Pulling base image ...
💾  Downloading Kubernetes v1.28.3 preload ...
    > preloaded-images-k8s-v18-v1...:  341.16 MiB / 341.16 MiB  100.00% 2.81 Mi
    > gcr.io/k8s-minikube/kicbase...:  410.58 MiB / 410.58 MiB  100.00% 2.82 Mi
🔥  Creating docker container (CPUs=2, Memory=6100MB) ...

🧯  Docker is nearly out of disk space, which may cause deployments to fail! (86% of capacity). You can pass '--force' to skip this check.
💡  Suggestion:

    Try one or more of the following to free up space on the device:

    1. Run "docker system prune" to remove unused Docker data (optionally with "-a")
    2. Increase the storage allocated to Docker for Desktop by clicking on:
    Docker icon > Preferences > Resources > Disk Image Size
    3. Run "minikube ssh -- docker system prune" if using the Docker container runtime
🍿  Related issue: https://github.com/kubernetes/minikube/issues/9024

🐳  Preparing Kubernetes v1.28.3 on Docker 24.0.7 ...
    ▪ Generating certificates and keys ...
    ▪ Booting up control plane ...
    ▪ Configuring RBAC rules ...
🔗  Configuring bridge CNI (Container Networking Interface) ...
🔎  Verifying Kubernetes components...
    ▪ Using image gcr.io/k8s-minikube/storage-provisioner:v5
🌟  Enabled addons: storage-provisioner, default-storageclass
🏄  Done! kubectl is now configured to use "minikube" cluster and "default" namespace by default

$ minikube stop

$ minikube delete

$ minikube start --driver=virtualbox
-->