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
sudo mv cosign-linux-amd64 /usr/local/bin/cosign

# Pull a sample container
sudo docker pull httpd
```

## Quick Start

```bash
cosign generate-key-pair
```

## References

- <https://github.com/sigstore/cosign>
- VirtualBox Issues
  - <https://github.com/hashicorp/vagrant/issues/8687>
  - <https://apple.stackexchange.com/questions/429609/running-vagrant-via-vagrant-up-on-macos-monterey-12-0-1-fails>

<!--
TODO:
-->
