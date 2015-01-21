#!/bin/sh

export ORIGPASSWD=$(cat /etc/passwd | grep teamcity)
export ORIG_UID=$(echo $ORIGPASSWD | cut -f3 -d:)
export ORIG_GID=$(echo $ORIGPASSWD | cut -f4 -d:)

export DEV_UID=${DEV_UID:=$ORIG_UID}
export DEV_GID=${DEV_GID:=$ORIG_GID}

ORIG_HOME=$(echo $ORIGPASSWD | cut -f6 -d:)

sed -i -e "s/:$ORIG_UID:$ORIG_GID:/:$DEV_UID:$DEV_GID:/" /etc/passwd
sed -i -e "s/teamcity:x:$ORIG_GID:/teamcity:x:$DEV_GID:/" /etc/group

chown -R ${DEV_UID}:${DEV_GID} ${ORIG_HOME}
chown -R ${DEV_UID}:${DEV_GID} "/opt/teamcity-agent"
