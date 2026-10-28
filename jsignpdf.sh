#!/bin/sh

# SPDX-FileCopyrightText: 2026 Pablo Romano
# SPDX-License-Identifier: 0BSD

# Use the packaged Java 21 runtime independently of archlinux-java's default.
exec /usr/lib/jvm/java-21-openjdk/bin/java \
  --add-exports=jdk.crypto.cryptoki/sun.security.pkcs11=ALL-UNNAMED \
  --add-exports=jdk.crypto.cryptoki/sun.security.pkcs11.wrapper=ALL-UNNAMED \
  --add-exports=java.base/sun.security.action=ALL-UNNAMED \
  --add-exports=java.base/sun.security.rsa=ALL-UNNAMED \
  --add-opens=java.base/sun.security.util=ALL-UNNAMED \
  -cp '/usr/share/java/jsignpdf/*' \
  com.intoolswetrust.jsignpdf.Bootstrap "$@"
