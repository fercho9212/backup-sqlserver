FROM ubuntu:18.04
RUN apt-get -y update && apt-get -y upgrade
RUN apt -y install curl
RUN apt-get install -y gnupg2
RUN curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add -
RUN curl https://packages.microsoft.com/config/ubuntu/18.04/prod.list > /etc/apt/sources.list.d/mssql-release.list
# install SQL Server drivers and tools
RUN apt-get update 
RUN ACCEPT_EULA=Y apt-get install -y --allow-unauthenticated msodbcsql17
RUN ACCEPT_EULA=Y apt-get install -y --allow-unauthenticated mssql-tools
RUN echo 'export PATH="$PATH:/opt/mssql-tools/bin"' >> ~/.bashrc
RUN /bin/bash -c "source ~/.bashrc"

RUN apt-get -y install locales
RUN locale-gen en_US.UTF-8
RUN update-locale LANG=en_US.UTF-8
 
RUN apt-get install openssh-server -y

RUN useradd user_ubuntu && \
    echo "user_ubuntu:1234" | chpasswd && \
    mkdir /home/user_ubuntu/.ssh -p && \
    chmod 700 /home/user_ubuntu/.ssh && \
    mkdir -p -m0755 /var/run/sshd

COPY key-ssh-ubuntu.pub /home/user_ubuntu/.ssh/authorized_keys

RUN chown user_ubuntu:user_ubuntu -R /home/user_ubuntu && \
    chmod 400 /home/user_ubuntu/.ssh/authorized_keys

CMD /usr/sbin/sshd -D

