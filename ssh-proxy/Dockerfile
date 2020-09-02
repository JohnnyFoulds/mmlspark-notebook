# docker build . -t foulds/ssh-proxy:0.1
# docker run -d --rm --name ssh-proxy -p 4040:22 foulds/ssh-proxy:0.1 /root/start.sh
# ssh -p 12923 -D 1337 -q -C -N root@197.95.152.171
#
# Web References
#  - https://hub.docker.com/r/rastasheep/ubuntu-sshd

FROM ubuntu:18.04
LABEL maintainer="Johnny Foulds <hfoulds@gmail.com>"

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
