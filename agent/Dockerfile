FROM dockerfile/java:oracle-java7
MAINTAINER Jack Feng <jackfengji@gmail.com>

RUN apt-get update
RUN apt-get install -y lib32stdc++6 lib32z1
RUN adduser teamcity

VOLUME /opt/teamcity-agent
VOLUME /home/teamcity
WORKDIR /home/teamcity

ADD setup-agent.sh /setup-agent.sh
ADD boot.sh /boot.sh

EXPOSE 9090
# CMD ["/boot.sh", "&&", "sudo", "-u", "teamcity", "/setup-agent.sh"]
CMD /boot.sh && sudo -u teamcity /setup-agent.sh
