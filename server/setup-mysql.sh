#!/bin/sh
if [ ! -d "/data/teamcity/lib/jdbc" ]; then
    cd /data/teamcity
    mkdir -p /data/teamcity/lib/jdbc
    wget http://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-5.1.34.zip
    unzip -jq -d lib/jdbc/ mysql-connector-java-5.1.34.zip "mysql-connector-java-5.1.34/mysql-connector-java-5.1.34-bin.jar"
    rm mysql-connector-java-5.1.34.zip
fi

exec /opt/TeamCity/bin/teamcity-server.sh run
