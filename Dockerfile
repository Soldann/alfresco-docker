FROM alfresco/alfresco-content-repository-community:6.2.0-ga

RUN java -jar /usr/local/tomcat/alfresco-mmt/alfresco-mmt*.jar install \
              /usr/local/tomcat/amps/alfresco-s3.amp \
              /usr/local/tomcat/webapps/alfresco -nobackup -force
