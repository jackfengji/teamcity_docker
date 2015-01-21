FROM kukool/openjdk-java-7
MAINTAINER Jack Feng <jackfengji@gmail.com>

VOLUME  ["/data/teamcity"]
ENV TEAMCITY_DATA_PATH /data/teamcity

ADD TeamCity /opt/TeamCity
EXPOSE 8111
CMD ["/opt/TeamCity/bin/teamcity-server.sh", "run"]
