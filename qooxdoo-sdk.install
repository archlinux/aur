#!/bin/sh
post_upgrade() {
  post_install $1
}

post_install() {
  echo "Qooxdoo SDK was installed into /opt/qooxdoo/<version> directory"
  echo "but you can use the symlink /opt/qooxdoo/current instead."
  echo ""
  echo "Read Getting Started guide on http://qooxdoo.org/ if you"
  echo "have any questions."
  echo ""
  echo "You may call qx-create-application to create a new qooxdoo application."
  echo ""
  echo "PLEASE DELETE /opt/qooxdoo/2.* TO GET RID OF OLD VERSIONS"
  echo ""
  echo ""
  echo "======================================================="
  echo "VERSION 4.0"
  echo ""
  echo "qooxdoo needs a cache directory which is located at /var/lib/qooxdoo/cache by this package."
  echo "Files created in there are created as current user. If another user uses the"
  echo "qooxdoo installation as well it might cause trouble."
}

op=$1
shift
$op $*

