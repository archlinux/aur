#!/bin/sh -e
# (C) 2008 Canonical Ltd.
# Author: Martin Pitt <martin.pitt@ubuntu.com>
# License: GPL v2 or later
# modified by David D Lowe and Thomas Detoux
# adapted for Arch Linux by Stefan Melmuk
#
# Setup user and temporary home directory for guest session.
# If this succeeds, this script needs to print the username as the last line to
# stdout.

export TEXTDOMAINDIR=/usr/share/locale
export TEXTDOMAIN=lightdm

# set the system wide locale for gettext calls
if [ -f /etc/locale.conf ]; then
  . /etc/locale.conf
  LANGUAGE=
  export LANG LANGUAGE
fi

is_system_user ()
{
  UID_MIN=$(cat /etc/login.defs | grep '^UID_MIN' | awk '{print $2}')
  SYS_UID_MIN=$(cat /etc/login.defs | grep SYS_UID_MIN | awk '{print $2}')
  SYS_UID_MAX=$(cat /etc/login.defs | grep SYS_UID_MAX | awk '{print $2}')

  SYS_UID_MIN=${SYS_UID_MIN:-101}
  SYS_UID_MAX=${SYS_UID_MAX:-$(( UID_MIN - 1 ))}

  [ ${1} -ge ${SYS_UID_MIN} ] && [ ${1} -le ${SYS_UID_MAX} ]
}

add_account ()
{
  temp_home=$(mktemp -td guest-XXXXXX)
  GUEST_HOME=$(echo ${temp_home} | tr '[:upper:]' '[:lower:]')
  GUEST_USER=${GUEST_HOME#/tmp/}
  if [ "${GUEST_HOME}" != "${temp_home}" ]; then
    mkdir -m 700 "${GUEST_HOME}" || {
      echo "Failed to create ${GUEST_USER}'s home directory (${GUEST_HOME})"
      exit 1
    }
    rmdir "${temp_home}"
  fi

  # if ${GUEST_USER} already exists, it must be a locked system account with no existing
  # home directory
  if PWSTAT=$(passwd -S ${GUEST_USER} 2>/dev/null); then
    if [ $(echo ${PWSTAT} | cut -f2 -d' ') != L ]; then
      echo "User account ${GUEST_USER} already exists and is not locked"
      exit 1
    fi

    PWENT=$(getent passwd ${GUEST_USER}) || {
      echo "getent passwd ${GUEST_USER} failed"
      exit 1
    }

    GUEST_UID=$(echo ${PWENT} | cut -f3 -d:)

    if ! is_system_user ${GUEST_UID}; then
      echo "Account ${GUEST_USER} is not a system user"
      exit 1
    fi

    GUEST_HOME=$(echo ${PWENT} | cut -f6 -d:)

    if [ ${GUEST_HOME} != / ] && [ ${GUEST_HOME#/tmp} = ${GUEST_HOME} ] && [ -d ${GUEST_HOME} ]; then
      echo "Home directory of ${GUEST_USER} already exists"
      exit 1
    fi
  else
    # does not exist, so create it
    useradd --system \
      --home-dir ${GUEST_HOME} \
      --comment $(gettext "Guest") \
      --user-group -G autologin \
      --shell /bin/bash \
    ${GUEST_USER} || {
      rm -rf ${GUEST_HOME}
      exit 1
    }
  fi

  site_gs=/etc/guest-session

  # create temporary home directory
  mount -t tmpfs -o mode=700,uid=${GUEST_USER} none ${GUEST_HOME} || {
    rm -rf ${GUEST_HOME}
    exit 1
  }

  if [ -d ${site_gs}/skel ] && [ "$(ls -A ${site_gs}/skel)" ]; then
    cp -rT ${site_gs}/skel/ ${GUEST_HOME}
    chown -R ${GUEST_USER}:${GUEST_USER} ${GUEST_HOME}
  else
    cp -rT /etc/skel/ ${GUEST_HOME}
    chown -R ${GUEST_USER}:${GUEST_USER} ${GUEST_HOME}
  fi

  # setup session
  if [ -f ${site_gs}/setup.sh ]; then
    su ${GUEST_USER} -c "env HOME=${GUEST_HOME} site_gs=${site_gs} ${site_gs}/setup.sh"
  fi

  # set possible local guest session preferences
  source_local_prefs() {
    local USER=${GUEST_USER}
    local HOME=${GUEST_HOME}
    . ${site_gs}/prefs.sh
    chown -R ${USER}:${USER} ${HOME}
  }
  if [ -f ${site_gs}/prefs.sh ]; then
    source_local_prefs
  fi

  echo ${GUEST_USER}
}

remove_account ()
{
  GUEST_USER=${1}

  PWENT=$(getent passwd ${GUEST_USER}) || {
    echo "Error: invalid user ${GUEST_USER}"
    exit 1
  }

  GUEST_UID=$(echo ${PWENT} | cut -f3 -d:)

  if ! is_system_user ${GUEST_UID}; then
    echo "Error: user ${GUEST_USER} is not a system user."
    exit 1
  fi

  GUEST_HOME=$(echo ${PWENT} | cut -f6 -d:)

  # kill all remaining processes
  if [ -x /bin/loginctl ] || [ -x /usr/bin/loginctl ]; then
    loginctl --signal=9 kill-user ${GUEST_USER} >/dev/null || true
  else
    while ps h -u ${GUEST_USER} >/dev/null
    do
      killall -9 -u ${GUEST_USER} || true
      sleep 0.2;
    done
  fi

  if [ ${GUEST_HOME} = ${GUEST_HOME#/tmp/} ]; then
    echo "Warning: home directory ${GUEST_HOME} is not in /tmp/. It won't be removed."
  else
    umount ${GUEST_HOME} || umount -l ${GUEST_HOME} || true # tmpfs mount
    rm -rf ${GUEST_HOME}
  fi

  # remove leftovers in /tmp
  find /tmp -mindepth 1 -maxdepth 1 -uid ${GUEST_UID} -print0 | xargs -0 rm -rf || true

  # remove possible {/run,}/media/guest-XXXXXX folder
  for media_dir in /run/media/${GUEST_USER} /media/${GUEST_USER}; do
    if [ -d ${media_dir} ]; then
      for dir in $(find ${media_dir} -mindepth 1 -maxdepth 1); do
        umount ${dir} || true
      done

      rmdir ${media_dir} || true
    fi
  done

  userdel --force ${GUEST_USER}
}

case ${1} in
  add)
    add_account
    ;;
  remove)
    if [ -z ${2} ] ; then
      echo "Usage: ${0} remove [account]"
      exit 1
    fi

    remove_account ${2}
    ;;
  *)
    echo "Usage: ${0} add"
    echo "       ${0} remove [account]"
    exit 1
esac
