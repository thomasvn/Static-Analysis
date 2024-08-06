# Karpenter

Attempting to run Karpenter locally, then follow controller logs upon changes to cluster.

First, template the Helm chart and review the manifest. Notably we need to install 3 CRDs (ec2nodeclasses.karpenter.k8s.aws, nodeclaims.karpenter.sh, nodepools.karpenter.sh) and the Karpenter controller along with its RBAC.

```sh
helm template karpenter-crd oci://public.ecr.aws/karpenter/karpenter-crd \
  -n karpenter > karpenter-crd.yaml

helm template karpenter oci://public.ecr.aws/karpenter/karpenter \
  -n karpenter > karpenter.yaml
```

```sh
helm upgrade -i karpenter-crd oci://public.ecr.aws/karpenter/karpenter-crd \
  -n karpenter --create-namespace
helm upgrade -i karpenter oci://public.ecr.aws/karpenter/karpenter \
  -n karpenter --create-namespace \
  --set settings.clusterName="docker-desktop" \
  --set privateCluster.enabled=true
```

## References

- <https://github.com/aws/karpenter-provider-aws/blob/main/charts/karpenter/README.md>

<!-- 
panic: failed to get region from metadata server: EC2MetadataRequestError: failed to get EC2 instance identity document
caused by: RequestError: send request failed
caused by: Get "http://169.254.169.254/latest/dynamic/instance-identity/document": dial tcp 169.254.169.254:80: connect: connection refused

goroutine 1 [running]:
github.com/samber/lo.must({0x2383ea0, 0x40007684c0}, {0x4000b1fc00, 0x1, 0x1})
    github.com/samber/lo@v1.39.0/errors.go:51 +0x1a8
github.com/samber/lo.Must[...](...)
    github.com/samber/lo@v1.39.0/errors.go:65
github.com/aws/karpenter-provider-aws/pkg/operator.NewOperator({0x2e7b4f8, 0x4000b8e570}, 0x4000aadc80)
    github.com/aws/karpenter-provider-aws/pkg/operator/operator.go:111 +0x230
main.main()
    github.com/aws/karpenter-provider-aws/cmd/controller/main.go:33 +0x28
Stream closed EOF for karpenter/karpenter-7c6bf47b7f-78w8j (controller)
 -->