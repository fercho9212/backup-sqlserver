FROM centos:8

RUN yum -y install openssh-server && \
    yum -y install passwd
#RUN userdel -r remote_user
RUN useradd remote_user && \
    echo "1234" | passwd remote_user --stdin && \
    mkdir /home/remote_user/.ssh && chmod 700 /home/remote_user/.ssh

COPY remote-key.pub /home/remote_user/.ssh/authorized_keys
#COPY bin/script.sh  /tmp/script.sh
#RUN chmod +x /tmp/script.sh
RUN chown remote_user:remote_user -R /home/remote_user && chmod 600 /home/remote_user/.ssh/authorized_keys

RUN /usr/bin/ssh-keygen -A


RUN ls -l /run/nologin && \ 
    rm /run/nologin
##CLIENTE MYSQL
RUN yum -y install mysql 
##AMAZON
RUN yum -y --enablerepo=extras install epel-release && \
    yum -y install python3 python3-pip
RUN curl -O https://bootstrap.pypa.io/get-pip.py 
RUN python3 get-pip.py --user
#ENV PATH "$PATH:/home/remote_user/.local/bin"
##ENV PATH="~/.local/bin:$PATH"
#RUN echo "export PATH=~/.local/bin:${PATH}" >> ~/.bash_profile
#RUN source ~/.bash_profile
RUN pip3 install --upgrade pip
#RUN pip3 install awscli --upgrade --user
#COPY bin/.bash_profile ~/.bash_profile
#RUN source ~/.bash_profile
RUN pip3 install awscli --upgrade --ignore-installed six
CMD /usr/sbin/sshd -D
  
