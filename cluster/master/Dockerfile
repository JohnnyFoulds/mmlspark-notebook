# sudo docker build . -f master/Dockerfile -t foulds/mmlspark-master:0.1
# sudo docker run -it --rm -e GRANT_SUDO=yes --user root -p 8888:8888 -p 8080:8080 -p 7077:7077 -p 6066:6066 foulds/mmlspark-master:0.1

FROM jupyter/datascience-notebook:3b1f4f5e6cc1
LABEL maintainer="Johnny Foulds <hfoulds@gmail.com>"

# Execute commands as the root user
USER root

# Configure environment variables
ENV JAVA_HOME="/usr/lib/jvm/java-1.8.0-openjdk-amd64" \
    SPARK_VERSION=2.4.3 \
    HADOOP_VERSION=2.7 \
    MMLSPARK_VERSION=1.0.0-rc1

# Install JRE
RUN echo "Installing JRE" && \
    apt-get -y update && \
    apt-get install -y --no-install-recommends openjdk-8-jre-headless && \
    apt-get -qq -y autoremove && \
    apt-get autoclean && \    
    rm -rf /var/lib/apt/lists/* /var/log/dpkg.log 

# Copy the Spark binaries
COPY bin/spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION} /spark

EXPOSE 8888 8080 7077 6066
