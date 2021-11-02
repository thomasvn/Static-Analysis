# Chef Inspec

## Download

Option 1:

```bash
docker pull chef/inspec

# Required to define this function for every shell session
function inspec { docker run -it --rm -v $(pwd):/share chef/inspec "$@"; }
```

Option 2:

```bash
# Set up a linux VM; download Docker; download ChefInspec
vagrant up
vagrant ssh

# When you'd like to pause or clean up your work
vagrant halt
vagrant destroy
```

## Check STIG controls for Apache 2.4

```bash
# Setup
git clone https://gitlab.dsolab.io/scv-content/inspec/apache/httpd_2.4x_server.git
sudo docker pull httpd:2.4.51
container_id=$(sudo docker run -d --rm --name httpd -p 8080:80 httpd:2.4.51)

# Execute all controls
sudo inspec exec httpd_2.4x_server -t docker://$container_id
```

## References

<!--
TODO
- VM
  - review all the Errors that ChefInspec gives
- Get a container running inspec to execute on another application container ?
  - Should we let the inspec function mount itself to /var/run/docker.sock ?
  - Should we make sure they share the same namespace ?
  ```
  /opt/inspec/embedded/lib/ruby/2.7.0/socket.rb:1214:in `__connect_nonblock': No such file or directory - connect(2) for /var/run/docker.sock (Errno::ENOENT) (Excon::Error::Socket)
  ```
- Reach out to DISA to see if there is more work being done on these Inspec Profiles?
 -->
