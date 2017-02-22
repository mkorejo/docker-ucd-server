#!/bin/bash
set -e

if [ "$1" = 'ucb' ]; then
  sed -i "s/\$BUILD_SERVER_HOSTNAME/$BUILD_SERVER_HOSTNAME/" /tmp/ibm-ucb-install/install.properties
  sed -i "s/\$HTTPS_PORT/$HTTPS_PORT/" /tmp/ibm-ucb-install/install.properties
  sed -i "s/\$JMS_PORT/$JMS_PORT/" /tmp/ibm-ucb-install/install.properties
  sed -i "s/\$DB_HOST/$DB_HOST/" /tmp/ibm-ucb-install/install.properties
  sed -i "s/\$MYSQL_PORT/$MYSQL_PORT/" /tmp/ibm-ucb-install/install.properties
  sed -i "s/\$DB_NAME/$DB_NAME/" /tmp/ibm-ucb-install/install.properties
  sed -i "s/\$DB_USER/$DB_USER/" /tmp/ibm-ucb-install/install.properties
  sed -i "s/\$DB_PASSWORD/$DB_PASSWORD/" /tmp/ibm-ucb-install/install.properties
  /tmp/ibm-ucb-install/install-server.sh
  exec /opt/ibm-ucb/server/bin/server run

elif [ "$1" = 'sleep' ]; then
  while true; do
    echo "running sleep";
    sleep 10;
  done;
fi;
