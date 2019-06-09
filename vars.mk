# Turtl core-rs expects OpenSSL v1.0.x, whereas the default (at least on my
# system) is v1.1.x, so here we manually specify prefixes for v1.0.x.
# This file is copied into the core-rs source tree and sourced automatically
# from the main Makefile.
export OPENSSL_INCLUDE_DIR=/usr/include/openssl-1.0
export OPENSSL_LIB_DIR=/usr/lib/openssl-1.0
