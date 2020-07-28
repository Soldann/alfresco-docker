FROM alfresco/alfresco-content-repository-community:6.2.0-ga

USER root

ADD alfresco-s3.amp /usr/local/tomcat/amps/alfresco-s3.amp

RUN java -jar /usr/local/tomcat/alfresco-mmt/alfresco-mmt*.jar install \
              /usr/local/tomcat/amps/alfresco-s3.amp \
              /usr/local/tomcat/webapps/alfresco -nobackup -force

# Manually delete backups because the nobackup flag is broken
RUN rm -r /usr/local/tomcat/webapps/alfresco/WEB-INF/classes/alfresco/module/backup

USER alfresco
