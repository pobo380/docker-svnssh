# Based on https://github.com/anderejd/svnssh/blob/fc91d760a16f9dee3d85820d3e0264c7ab741fce/svnssh/Dockerfile
FROM alpine:3.10
EXPOSE 22

RUN apk add --no-cache openssh subversion \
  && sed -i s/#PermitRootLogin.*/PermitRootLogin\ no/ /etc/ssh/sshd_config \
  && sed -i s/#PasswordAuthentication.*/PasswordAuthentication\ no/ /etc/ssh/sshd_config \
  && passwd -d root \
  && adduser -D -s /bin/ash svn \
  && passwd -u svn \
  && mkdir /home/svn/svn_root \
  && chown -R svn:svn /home/svn \
