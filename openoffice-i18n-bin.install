#!/bin/bash

post_install() {
	: # obsolete code
	
  local RPM_INSTALL_PREFIX='opt'

  ( ### ooo-dev3-dict-de-DE-3.4.0-9583.i586.rpm postin

if [ -x "$RPM_INSTALL_PREFIX/openoffice4/program/unopkg" ]; then
  "$RPM_INSTALL_PREFIX/openoffice4/program/unopkg" sync 
  if [ "$?" != "0" ]; then
    echo "ERROR: Registration of extensions failed!"
    exit 1
  else
    echo "SUCCESS: unopkg returns successful!"
  fi
  find "$RPM_INSTALL_PREFIX/openoffice4/share/prereg/bundled" -type f -exec chmod 644 {} \;
fi

exit 0
  )

}

post_remove() {
	: # obsolete code

  local RPM_INSTALL_PREFIX='opt'

  ( ### ooo-dev3-dict-de-DE-3.4.0-9583.i586.rpm postun

if [ -x "$RPM_INSTALL_PREFIX/openoffice4/program/unopkg" ]; then
  "$RPM_INSTALL_PREFIX/openoffice4/program/unopkg" sync 
  if [ "$?" != "0" ]; then
    echo "ERROR: Registration of extensions failed!"
    exit 1
  else
    echo "SUCCESS: unopkg returns successful!"
  fi
  find "$RPM_INSTALL_PREFIX/openoffice4/share/prereg/bundled" -type f -exec chmod 644 {} \;
fi

exit 0
  )

}

## arg 1:  the new package version
## arg 2:  the old package version
post_upgrade() {
  post_install "$1"
}

# vim:set ts=2 sw=2 et:
