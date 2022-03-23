#!/usr/bin/env sh

post_install() {
    echo '--------------'
    echo '| QUICKSTART |'
    echo '--------------'
    echo '1. Make sure to start the sysbox service (systemctl start sysbox)'
    echo ''
    echo '2. To use sysbox with Docker, add the following to /etc/docker/daemon.json:'
    echo '{'
    echo '  "runtimes": {'
    echo '    "sysbox-runc": {'
    echo '      "path": "/usr/bin/sysbox-runc",'
    echo '      "runtimeArgs": ["--no-kernel-check"]'
    echo '    }'
    echo '  }'
    echo '}'
    echo 'Then restart the docker service (systemctl restart docker)'
    echo ''
    echo 'Note that Arch Linux is NOT officially supported.'
    echo 'For more information, please check:'
    echo 'https://github.com/nestybox/sysbox/blob/master/docs/user-guide/troubleshoot.md'
}
