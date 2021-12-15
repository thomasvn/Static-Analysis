# Cosign (container image signing)

## Environment Setup

```bash
# Setup VM
vagrant up
vagrant ssh

# Pause or destroy VM
vagrant halt
vagrant destroy
```

```bash
# Download Cosign
curl -LO https://github.com/sigstore/cosign/releases/download/v1.3.1/cosign-linux-amd64
chmod +x cosign-linux-amd64
sudo mv cosign-linux-amd64 /usr/local/bin/cosign

# Generate Key Pair
cosign generate-key-pair

# Pull a sample container
sudo docker pull httpd
```

## Quick Start

If you have permissions to push the image to the registry:

```bash
# Sign a container and store the signature in the registry
cosign sign --key cosign.key httpd
```

If you don't have permissions to push the image to the registry:

```bash
# Generate the json payload that will be signed. It uses the digest found in "docker images --digests"
cosign generate httpd > httpd.payload

# Generate a digest of the payload
openssl sha256 httpd.payload > httpd.sha256

# Sign the payload (NOT WORKING)
openssl dgst -sha256 -sign cosign.key -out httpd.sig httpd.payload
```

## References

- <https://github.com/sigstore/cosign>
- VirtualBox Issues
  - <https://github.com/hashicorp/vagrant/issues/8687>
  - <https://apple.stackexchange.com/questions/429609/running-vagrant-via-vagrant-up-on-macos-monterey-12-0-1-fails>

<!--
TODO:
- signing using the openssl tool
- signing with PIV
-->
