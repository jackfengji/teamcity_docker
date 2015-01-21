#!/bin/sh

AGENT_DIR="/opt/teamcity-agent"
TEAMCITY_SERVER="http://server:8111/"

if [ ! -f "$AGENT_DIR/bin/agent.sh" ]; then
    echo "Setting up TeamCityagent for the first time..."
    echo "Agent will be installed to ${AGENT_DIR}."
    cd /home/teamcity
    wget ${TEAMCITY_SERVER}update/buildAgent.zip
    unzip -q -d $AGENT_DIR buildAgent.zip
    rm buildAgent.zip
    chmod +x $AGENT_DIR/bin/agent.sh
    echo "serverUrl=${TEAMCITY_SERVER}" > $AGENT_DIR/conf/buildAgent.properties
    echo "name=" >> $AGENT_DIR/conf/buildAgent.properties
    echo "workDir=/home/teamcity/work" >> $AGENT_DIR/conf/buildAgent.properties
    echo "tempDir=/home/teamcity/temp" >> $AGENT_DIR/conf/buildAgent.properties
    echo "systemDir=/home/teamcity/system" >> $AGENT_DIR/conf/buildAgent.properties
    echo "teamcity_logs=/home/teamcity/logs" >> $AGENT_DIR/conf/buildAgent.properties
    echo "ownPort=9090" >> $AGENT_DIR/conf/buildAgent.properties
    echo "authorizationToken=" >> $AGENT_DIR/conf/buildAgent.properties
    echo "env.ANDROID_HOME=/opt/android-sdk" >> $AGENT_DIR/conf/buildAgent.properties
else
    echo "Using agent at ${AGENT_DIR}."
fi

exec $AGENT_DIR/bin/agent.sh run
