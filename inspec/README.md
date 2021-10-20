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
# Set up a linux VM

# Download inspec and its dependencies
apt-get -y install ruby ruby-dev gcc g++ make
gem install inspec-bin

# !! Read the script for yourself first !!
# curl https://omnitruck.chef.io/install.sh | sudo bash -s -- -P inspec
```

## Check STIG controls for Apache 2.4

```bash
# Setup
git clone https://gitlab.dsolab.io/scv-content/inspec/apache/httpd_2.4x_server.git
docker pull httpd:2.4.51
container_id=$(docker run -d --rm --name httpd -p 8080:80 httpd:2.4.51)

# Execute all controls
inspec exec httpd_2.4x_server -t docker://$container_id
```

## References

<!--
TODO
- Get a container running inspec to execute on another application container ?
  ```
  /opt/inspec/embedded/lib/ruby/2.7.0/socket.rb:1214:in `__connect_nonblock': No such file or directory - connect(2) for /var/run/docker.sock (Errno::ENOENT) (Excon::Error::Socket)
  ```
 -->
