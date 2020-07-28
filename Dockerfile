FROM alpine/git as clone

WORKDIR /app

RUN git clone https://github.com/Soldann/alfresco-s3-adapter


FROM maven:latest as builder

COPY --from=clone /app/alfresco-s3-adapter /usr/local/alfresco-s3-adapter

WORKDIR /usr/local/alfresco-s3-adapter

RUN mvn clean install


FROM alfresco/alfresco-content-repository-community:6.2.0-ga

USER root

COPY --from=builder /usr/local/alfresco-s3-adapter/target/alfresco-s3.amp /usr/local/tomcat/amps/alfresco-s3.amp

RUN java -jar /usr/local/tomcat/alfresco-mmt/alfresco-mmt*.jar install \
              /usr/local/tomcat/amps/alfresco-s3.amp \
              /usr/local/tomcat/webapps/alfresco -nobackup -force

# Manually delete backups because the nobackup flag is broken
RUN rm -r /usr/local/tomcat/webapps/alfresco/WEB-INF/classes/alfresco/module/backup

ENV ACCESS_KEY= 
ENV SECRET_KEY=
ENV BUCKET_NAME=
ENV URL=

# Use custom run script to edit alfresco-global.properties before launching alfresco
ADD run.sh /usr/local/tomcat/bin/run.sh
RUN chmod 777 /usr/local/tomcat/bin/run.sh && chmod 777 /usr/local/tomcat/webapps/alfresco/WEB-INF/classes/alfresco/module/alfresco-s3/

CMD ["/usr/local/tomcat/bin/run.sh"]

USER alfresco

