# FROM registry.access.redhat.com/ubi8/ubi:latest
FROM fedora

# OpenSCAP
RUN yum install openscap-scanner -y
RUN yum install scap-security-guide -y

# Additional dependencies
RUN yum install wget unzip -y
