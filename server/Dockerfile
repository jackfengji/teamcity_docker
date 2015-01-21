FROM dockerfile/java:oracle-java7
MAINTAINER Jack Feng <jackfengji@gmail.com>

VOLUME  ["/data/teamcity"]
ENV TEAMCITY_DATA_PATH /data/teamcity

RUN wget -qO- http://download.jetbrains.com/teamcity/TeamCity-9.0.1.tar.gz | tar xz -C /opt
ADD setup-mysql.sh /setup-mysql.sh
EXPOSE 8111
CMD ["/setup-mysql.sh"]
