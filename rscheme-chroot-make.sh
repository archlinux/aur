#!/bin/bash
cd /tmp/rs-0.7.3.4-b7
make stage1
cd src
./configure --prefix=/usr/share/rs/0.7.3.4-b7u
make INSTALL_DIR=/usr/share/rs/0.7.3.4-b7u all
make INSTALL_DIR=/usr/share/rs/0.7.3.4-b7u packages
make INSTALL_DIR=/usr/share/rs/0.7.3.4-b7u fasl_shell
