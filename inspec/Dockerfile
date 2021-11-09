################################################################################
FROM httpd:2.4.51 as base

RUN echo "Hardening httpd ..."


################################################################################
FROM base as test

USER root

RUN echo "Running Chef Inspec scan ..."
RUN apt update -y && apt upgrade -y
RUN apt install -y curl git
RUN curl https://omnitruck.chef.io/install.sh | bash -s -- -P inspec
RUN git clone https://gitlab.dsolab.io/scv-content/inspec/apache/httpd_2.4x_server.git


################################################################################
FROM base as final

USER apache
EXPOSE 80
CMD [ "httpd-foreground" ]
