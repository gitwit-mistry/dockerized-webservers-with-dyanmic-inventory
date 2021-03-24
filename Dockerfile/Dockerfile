FROM centos:7

ARG USERNAME=docker
EXPOSE 22

RUN yum update -y && yum install net-tools -y  && yum install openssh-server -y  && yum install httpd -y sudo

RUN useradd -ms /bin/bash $USERNAME

RUN yum autoremove -y

COPY entrypoint.sh entrypoint.sh
RUN chmod +x /entrypoint.sh

USER $USERNAME
RUN mkdir /home/$USERNAME/.ssh
COPY container_key.pub /home/$USERNAME/.ssh/authorized_keys

USER root
RUN chown $USERNAME /home/$USERNAME/.ssh/authorized_keys && chmod 600 /home/$USERNAME/.ssh/authorized_keys

RUN ifconfig
RUN netstat -tnlp

RUN echo "${USERNAME} ALL=(ALL) NOPASSWD: ALL " >> /etc/sudoers

#CMD ["bin/bash"]
CMD ["/entrypoint.sh"]
