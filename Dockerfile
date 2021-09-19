FROM debian
RUN apt update \
  && DEBIAN_FRONTEND=noninteractive apt install firefox-esr mate-system-monitor  git lxde tightvncserver wget   -y \
  && wget https://github.com/novnc/noVNC/archive/refs/tags/v1.2.0.tar.gz \
  && tar -xvf v1.2.0.tar.gz \
  && mkdir  /root/.vnc \
  && echo 'uncleluo' | vncpasswd -f > /root/.vnc/passwd \
  && chmod 600 /root/.vnc/passwd \
  && cp /noVNC-1.2.0/vnc.html /noVNC-1.2.0/index.html \
  && echo 'cd /root' >>/luo.sh \
  && echo "su root -l -c 'vncserver :2000 ' "  >>/luo.sh \
  && echo 'cd /noVNC-1.2.0' >>/luo.sh \
  && echo './utils/launch.sh  --vnc localhost:7900 --listen 80 ' >>/luo.sh \
  && echo root:laoluoshushu|chpasswd \
  && chmod 755 /luo.sh
EXPOSE 80
CMD  /luo.sh
