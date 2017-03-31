#!/bin/bash
set -e

if [ "$1" = 'ucd' ]; then
  sed -i "s/\$DEPLOY_SERVER_HOSTNAME/$DEPLOY_SERVER_HOSTNAME/" /tmp/ibm-ucd-install/install.properties
  sed -i "s/\$HTTPS_PORT/$HTTPS_PORT/" /tmp/ibm-ucd-install/install.properties
  sed -i "s/\$JMS_PORT/$JMS_PORT/" /tmp/ibm-ucd-install/install.properties
  sed -i "s/\$DB_HOST/$DB_HOST/" /tmp/ibm-ucd-install/install.properties
  sed -i "s/\$MYSQL_PORT/$MYSQL_PORT/" /tmp/ibm-ucd-install/install.properties
  sed -i "s/\$DB_NAME/$DB_NAME/" /tmp/ibm-ucd-install/install.properties
  sed -i "s/\$DB_USER/$DB_USER/" /tmp/ibm-ucd-install/install.properties
  sed -i "s/\$DB_PASSWORD/$DB_PASSWORD/" /tmp/ibm-ucd-install/install.properties
  sed -i "s/\$ADMIN_PASSWORD/$ADMIN_PASSWORD/" /tmp/ibm-ucd-install/install.properties

  /tmp/ibm-ucd-install/install-server.sh
  exec /opt/ibm-ucd/server/bin/server run

elif [ "$1" = 'sleep' ]; then
  while true; do
    echo "running sleep";
    sleep 10;
  done;
fi;
