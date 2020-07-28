#!/bin/bash

export CATALINA_HOME=/usr/local/tomcat
sed -i "s|aws.accessKey=|aws.accessKey=${ACCESS_KEY}|g" ${CATALINA_HOME}/webapps/alfresco/WEB-INF/classes/alfresco/module/alfresco-s3/alfresco-global.properties
sed -i "s|aws.secretKey=|aws.secretKey=${SECRET_KEY}|g" ${CATALINA_HOME}/webapps/alfresco/WEB-INF/classes/alfresco/module/alfresco-s3/alfresco-global.properties
sed -i "s|aws.s3.bucketName=|aws.bucketName=${BUCKET_NAME}|g" ${CATALINA_HOME}/webapps/alfresco/WEB-INF/classes/alfresco/module/alfresco-s3/alfresco-global.properties
sed -i "s|aws.s3.url=|aws.s3.url=${URL}|g" ${CATALINA_HOME}/webapps/alfresco/WEB-INF/classes/alfresco/module/alfresco-s3/alfresco-global.properties

${CATALINA_HOME}/bin/catalina.sh run -security
