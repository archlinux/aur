rm -rf /tmp/thu-isatap
git clone https://github.com/panda2134/thu-isatap.git /tmp/thu-isatap
cd /tmp/thu-isatap/

install -D -m755 "thu-isatap" "/usr/bin/thu-isatap"
install -D -m644 "thu-isatap.service" "/usr/lib/systemd/system/thu-isatap.service"