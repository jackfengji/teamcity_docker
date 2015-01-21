FROM kukool/openjdk-java-7
MAINTAINER Jack Feng <jackfengji@gmail.com>

RUN apt-get install -y lib32stdc++6 lib32z1
RUN adduser teamcity

VOLUME /opt/teamcity-agent
VOLUME /home/teamcity
WORKDIR /home/teamcity

ADD boot.sh /boot.sh

EXPOSE 9090
CMD bash /boot.sh && chown -R teamcity:teamcity /opt/teamcity-agent && sudo -u teamcity -s -- sh -c "bash /opt/teamcity-agent/bin/agent.sh run"
