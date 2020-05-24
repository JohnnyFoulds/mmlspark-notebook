# docker build . -t foulds/ngrok-ssh:0.1
# docker run -d --rm --name ngrok-ssh -p 4040:22 -e NGROKTOKEN=123 foulds/ngrok-ssh:0.1 /root/start.sh
#
# ngrok tcp --region=us --remote-addr 1.tcp.ngrok.io:20301 22
#
# Web References
#  - https://ngrok.com/docs#tcp
#  - https://hub.docker.com/r/rastasheep/ubuntu-sshd
#  - https://github.com/ewoutp/ngrok-ssh/blob/master/Dockerfile
#  - https://dashboard.ngrok.com/status/tunnels

FROM ubuntu:18.04
LABEL maintainer="Johnny Foulds <hfoulds@gmail.com>"

# Configure environment variables

# Download ngrok
ADD https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.deb /

# Install ngok
RUN echo "Installing ngrok" && \
    apt install /ngrok-stable-linux-amd64.deb && \
    rm /ngrok-stable-linux-amd64.deb

# Install sshd
RUN echo "Installing sshd" && \
    apt-get -y update && \
    apt-get install -y --no-install-recommends openssh-server && \
    mkdir /var/run/sshd && \
    apt-get -qq -y autoremove && \
    apt-get autoclean && \    
    rm -rf /var/lib/apt/lists/* /var/log/dpkg.log 

# Configure sshd
RUN echo "Configuring sshd" && \
    echo 'root:root' | chpasswd && \
    sed -ri 's/^#?PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    sed -i "s/.*PasswordAuthentication.*/PasswordAuthentication no/g" /etc/ssh/sshd_config && \
    sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config

# Configuring the ssh keys
COPY authorized_keys /root/.ssh/authorized_keys
RUN echo "Configuring ssh keys" && \
    chown root:root /root/.ssh/authorized_keys

# Copy the startup script
COPY start.sh /root/start.sh
RUN chmod +x /root/start.sh

EXPOSE 22
