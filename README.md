# alfresco-docker
Alfresco Dockerfile

This Docker image deploys Alfresco 6.2.0 with https://github.com/Soldann/alfresco-s3-adapter for integration with an S3 ContentStore.

### Usage
The following env variables are **required**:
* ```ACCESS_KEY``` the access key for the S3 server
* ```SECRET_KEY``` the secret key for the S3 server
* ```BUCKET_NAME``` the name of the bucket you would like Alfresco to store data to
* ```URL``` the URL of the S3 server

Substitute alfresco/alfresco-content-repository-community:6.2.0-ga with this image where applicable (in docker-compose, kubernetes yaml, etc...)
