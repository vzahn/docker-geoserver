FROM centos:7

RUN yum -y update; yum clean all
RUN yum -y install git wget; yum clean all

WORKDIR /opt/
RUN wget https://github.com/omniscale/imposm3/releases/download/v0.8.1/imposm-0.8.1-linux-x86-64.tar.gz
RUN tar zxvf imposm-0.8.1-linux-x86-64.tar.gz
RUN rm -f imposm-0.8.1-linux-x86-64.tar.gz

RUN git clone https://github.com/geosolutions-it/osm-styles.git

COPY import.sh import.config /opt/

RUN mkdir /opt/maps

CMD ["/opt/import.sh"]
#CMD ["/bin/bash"]
