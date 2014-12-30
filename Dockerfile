FROM centos:centos7
MAINTAINER Alfredo Matas "amatas@gmail.com"

# Enable EPEL for CouchDB
RUN yum -y upgrade && \
    yum -y install epel-release && \
    yum clean all

# Install CouchDB
RUN yum install -y couchdb && \
    yum clean all && \
    sed -e 's/^bind_address = .*$/bind_address = 0.0.0.0/' -i /etc/couchdb/default.ini

EXPOSE 5984

VOLUME ["/var/lib/couchdb"]

CMD ["/bin/sh", "-e", "/usr/bin/couchdb", "-a", "/etc/couchdb/default.ini", "-a", "/etc/couchdb/local.ini", "-b", "-r", "5", "-p", "/var/run/couchdb/couchdb.pid", "-o", "/dev/null", "-e", "/dev/null", "-R"]