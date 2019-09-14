FROM centos:7

RUN yum -y update; yum clean all
RUN yum -y install wget unzip java-1.8.0-openjdk; yum clean all

WORKDIR /tmp/

# get GeoServer and install system independent binary 
ENV GEOSERVER_HOME=/usr/share/geoserver
ENV GEOSERVER_VERSION=2.15.2

RUN wget http://sourceforge.net/projects/geoserver/files/GeoServer/$GEOSERVER_VERSION/geoserver-$GEOSERVER_VERSION-bin.zip
RUN unzip geoserver-$GEOSERVER_VERSION-bin.zip
RUN mv geoserver-$GEOSERVER_VERSION /usr/share/
RUN ln -snf /usr/share/geoserver-$GEOSERVER_VERSION /usr/share/geoserver
RUN rm -f geoserver-$GEOSERVER_VERSION-bin.zip

#get necessary plugins and install them
RUN wget http://sourceforge.net/projects/geoserver/files/GeoServer/$GEOSERVER_VERSION/extensions/geoserver-$GEOSERVER_VERSION-feature-pregeneralized-plugin.zip
RUN unzip geoserver-$GEOSERVER_VERSION-feature-pregeneralized-plugin.zip -d $GEOSERVER_HOME/webapps/geoserver/WEB-INF/lib/
RUN rm geoserver-$GEOSERVER_VERSION-feature-pregeneralized-plugin.zip

RUN wget http://sourceforge.net/projects/geoserver/files/GeoServer/$GEOSERVER_VERSION/extensions/geoserver-$GEOSERVER_VERSION-css-plugin.zip
RUN unzip geoserver-$GEOSERVER_VERSION-css-plugin.zip -d $GEOSERVER_HOME/webapps/geoserver/WEB-INF/lib/
RUN rm geoserver-$GEOSERVER_VERSION-css-plugin.zip

WORKDIR /
ENV JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.222.b10-0.el7_6.x86_64/jre
CMD ["/usr/share/geoserver/bin/startup.sh"]
