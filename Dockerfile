# docker build . -t mmlspark-notebook:0.1

FROM jupyter/datascience-notebook:3b1f4f5e6cc1
LABEL maintainer="Johnny Foulds <hfoulds@gmail.com>"

# Configure environment variables
ENV JAVA_HOME="/usr/lib/jvm/java-1.8.0-openjdk-amd64" \
    SPARK_VERSION=2.4.3 \
    MMLSPARK_VERSION=1.0.0-rc1

# Install PySpark
RUN echo "Installing PySpark" \
    conda install pyspark=${SPARK_VERSION}

EXPOSE 8888/tcp