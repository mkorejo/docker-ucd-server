FROM openjdk:8u111-jre
MAINTAINER Murad Korejo <mkorejo@us.ibm.com>

ARG ARTIFACT_DOWNLOAD_URL
ENV HTTPS_PORT=8443 JMS_PORT=7918 MYSQL_PORT=3306 DB_NAME="ibm_ucd" \
  DB_USER="ibm_ucd" DB_PASSWORD="password" \
  ADMIN_PASSWORD="admin"

COPY install.properties /tmp
COPY entrypoint.sh /ucd_entrypoint.sh

RUN curl -Lk $ARTIFACT_DOWNLOAD_URL > /tmp/ucd-server.zip \
  && curl -Lk https://goo.gl/wTTngT > /tmp/mysql_jdbc.jar \
  && unzip -d /tmp /tmp/ucd-server.zip \
  && cat /tmp/ibm-ucd-install/install.properties | grep version >> /tmp/install.properties \
  && mv /tmp/install.properties /tmp/ibm-ucd-install/install.properties \
  && mv /tmp/mysql_jdbc.jar /tmp/ibm-ucd-install/lib/ext \
  && sed -i '85isync' /tmp/ibm-ucd-install/install-server.sh \
  && chmod +x /tmp/ibm-ucd-install/install-server.sh \
  && chmod +x /ucd_entrypoint.sh \
  && rm /tmp/ucd-server.zip

ENTRYPOINT ["/ucd_entrypoint.sh", "ucd"]
