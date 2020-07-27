FROM alfresco/alfresco-content-repository-community:6.2.0-ga

USER root

RUN yum install git -y
RUN git clone https://github.com/Soldann/alfresco-s3-adapter.git
RUN cd alfresco-s3-adapter && git checkout minio-feature

RUN yum install maven -y
RUN cd alfresco-s3-adapter && mvn clean install

RUN cp target/alfresco-s3.amp /usr/local/tomcat/amps/alfresco-s3.amp

RUN java -jar /usr/local/tomcat/alfresco-mmt/alfresco-mmt*.jar install \
              /usr/local/tomcat/amps/alfresco-s3.amp \
              /usr/local/tomcat/webapps/alfresco -nobackup -force

USER alfresco
