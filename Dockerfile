FROM ubuntu:rolling as base

ENV DEBIAN_FRONTEND noninteractive

ARG USERNAME
ARG PASSWORD

RUN apt update && \
    apt upgrade -y && \
    apt install -y sudo ubuntu-mate-desktop xrdp supervisor && \
    printf "[program:xrdp-sesman]\ncommand=/usr/sbin/xrdp-sesman -n\nprocess_name = xrdp-sesman\n\n[program:xrdp]\ncommand=/usr/sbin/xrdp -n\nprocess_name = xrdp" > /etc/supervisor/conf.d/xrdp.conf && \
    apt purge -y apport

RUN printf "${PASSWORD}\n${PASSWORD}" | adduser ${USERNAME} && \
    adduser ${USERNAME} sudo && \
    echo "mate-session" > /home/${USERNAME}/.xsession

CMD ["/usr/bin/supervisord", "-n"]
