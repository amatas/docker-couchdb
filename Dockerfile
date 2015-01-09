FROM centos:centos7
MAINTAINER Alfredo Matas "amatas@gmail.com"

# Enable EPEL for CouchDB
RUN yum -y install epel-release && \
    yum clean all

# Install CouchDB
RUN yum install -y couchdb && \
    yum clean all && \
    sed -e 's/^bind_address = .*$/bind_address = 0.0.0.0/' -i /etc/couchdb/default.ini

EXPOSE 5984

VOLUME ["/var/lib/couchdb"]

ADD entrypoint.sh /usr/local/bin/entrypoint.sh

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

CMD ["couchdb"]
