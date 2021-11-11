# Chef Inspec

## Option 1 (Inspec in a container)

```bash
# Required to define this function for every shell session
# NOTE: be cautious when letting a container mount to "/var/run/docker.sock"
function inspec { docker run -it --rm -v $(pwd):/share -v /var/run/docker.sock:/var/run/docker.sock chef/inspec "$@"; }

# Setup
git clone https://gitlab.dsolab.io/scv-content/inspec/apache/httpd_2.4x_server.git
docker pull httpd:2.4.51
container_id=$(docker run -d --rm --name httpd -p 8080:80 httpd:2.4.51)

# Execute all controls
docker pull chef/inspec
inspec exec httpd_2.4x_server -t docker://$container_id
```

## Option 2 (Inspec in a VM)

```bash
# Set up a linux VM; download Docker; download ChefInspec
vagrant up
vagrant ssh

# Setup
git clone https://gitlab.dsolab.io/scv-content/inspec/apache/httpd_2.4x_server.git
sudo docker pull httpd:2.4.51
container_id=$(sudo docker run -d --rm --name httpd -p 8080:80 httpd:2.4.51)

# Execute all controls
sudo inspec exec httpd_2.4x_server -t docker://$container_id

# When you'd like to pause or clean up your work
vagrant halt
vagrant destroy
```

## Option 3 (Inspec in a build)

```bash
# Build the container image, and make sure that the "test" stage is run.
docker build --pull -t httpd-hardened --target test .
```

## Option 4 (Inspec in a sidecar container)

```bash
# start up containers
docker-compose up -d
docker-compose exec inspec-sidecar

# Run Inspec
echo "config_path: /httpd/conf/httpd.conf" >> input.yml
inspec exec httpd_2.4x_server --input config_path=/httpd/conf/httpd.conf /httpd
inspec exec httpd_2.4x_server --input-file input.yml /httpd

# destroy containers, networks, volumes
docker-compose down
docker volume prune
```

## References

- <https://github.com/inspec/inspec>
- <https://gitlab.dsolab.io/scv-content/>
- <https://hub.docker.com/_/httpd>

<!--
TODO
- VM
  - https://github.com/hashicorp/vagrant/issues/12557
  - review all the Errors that ChefInspec gives
- Get a container running inspec to execute on another application container ?
  - examine the results for hardened apache?
- Inspec Sidecar
  - let sidecar see all files from app container
    - https://www.magalix.com/blog/the-sidecar-pattern
  - exec into the sidecar and manually scan the other container
  - https://zwischenzugs.com/2015/06/24/the-most-pointless-docker-command-ever/
  - set up cronjob to scan containers in same network
  - https://docs.docker.com/compose/compose-file/compose-file-v3/
- Reach out to DISA to see if there is more work being done on these Inspec Profiles?

DEBUG
- uninstall and reinstall VirtualBox and Vagrant if there are issues starting VM

```
docker-compose run httpd bash
```
 -->
