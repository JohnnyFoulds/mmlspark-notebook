# docker build . -t foulds/mmlspark-notebook:0.1
# docker run -it --rm -e GRANT_SUDO=yes --user root -p 8888:8888 foulds/mmlspark-notebook:0.1 start.sh jupyter lab

FROM jupyter/datascience-notebook:3b1f4f5e6cc1
LABEL maintainer="Johnny Foulds <hfoulds@gmail.com>"

# Execute commands as the root user
USER root

# Configure environment variables
ENV JAVA_HOME="/usr/lib/jvm/java-1.8.0-openjdk-amd64" \
    SPARK_VERSION=2.4.3 \
    MMLSPARK_VERSION=1.0.0-rc1

# Install JRE
RUN echo "Installing JRE" && \
    apt-get -y update && \
    apt-get install -y --no-install-recommends openjdk-8-jre-headless && \
    apt-get -qq -y autoremove && \
    apt-get autoclean && \    
    rm -rf /var/lib/apt/lists/* /var/log/dpkg.log 


# Install PySpark
RUN echo "Installing PySpark" && \
    conda install --quiet --yes pyspark=${SPARK_VERSION} && \
    conda clean --all --yes

# Set the IPython Startup Script
COPY init_notebook.py /home/$NB_USER/.ipython/profile_default/startup/
RUN chown -R $NB_USER /home/$NB_USER/.ipython

# Load the MMLSpark dependencies
USER $NB_USER
RUN echo "Initialize MMLSpark" && \
    ipython -i my_commands.py

# Copy sample notebooks
COPY notebooks notebooks