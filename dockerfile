FROM ubuntu

WORKDIR /home

COPY StartupScript.sh /home/

RUN apt-get update
RUN apt-get -y install dos2unix
RUN dos2unix /home/StartupScript.sh /home/StartupScript.sh
RUN chmod +x /home/StartupScript.sh
RUN apt-get -y install wget
RUN apt-get -y install vim
RUN apt-get -y install curl
RUN apt-get -y install dnsutils
RUN apt-get -y install net-tools
RUN apt-get -y install psmisc
RUN apt-get -y install less
RUN curl -o bootstrap-salt.sh -L https://bootstrap.saltstack.com
RUN sh bootstrap-salt.sh -P -M
RUN apt-get update
RUN echo salt-master ip is below:
RUN hostname -i
RUN sed -i "s/#interface: 0.0.0.0/interface: $(hostname -i)/g" /etc/salt/master
RUN sed -i "s/#master: salt/master: $(hostname -i)/g" /etc/salt/minion
RUN cat /home/StartupScript.sh

ENTRYPOINT ["/home/StartupScript.sh"]
CMD [""]
