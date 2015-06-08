#!/bin/sh
# vim:set ts=2 sw=2 et:

## CHANGE the following two variables according to your preference
##  /bin/true:  start/enable systemd service during installation
##  /bin/false: do not touch systemd services, manually enable/start the service
_service_start=/bin/false
_service_enable=/bin/true

_service_name=gerrit.service
_service_username=gerrit
_service_groupname=${_service_username}
_service_install_dir=/var/lib/${_service_username}
_service_cache_dir=
_service_log_dir=/var/log/${_service_username}

_set_dir_permissions() {
  for d in "${_service_install_dir}" "${_service_cache_dir}"; do
    [ -n "${d}" -a -d "${d}" ] && chown -R ${_service_username}:${_service_groupname} ${d}
  done
}

# Test whether the system is running with systemd.
_is_running_systemd() {
  ps -p 1 | grep -q "systemd"
}

# Test whether the systemd service is enabled (presuming that systemd is running).
_is_systemd_service_enabled() {
  /usr/bin/systemctl is-enabled --quiet ${_service_name} 2>/dev/null
}

_stop_systemd_service() {
  if `eval ${_service_start}`; then
    /usr/bin/systemctl stop ${_service_name} 2>/dev/null
  fi;
  return 0;
}

_start_systemd_service() {
  _is_running_systemd || return 0;
  _is_systemd_service_enabled || return 0;
  if `eval ${_service_start}`; then
    /usr/bin/systemctl start ${_service_name};
  fi;
  return 0;
}

_disable_systemd_service() {
  if `eval ${_service_enable}`; then
    _is_systemd_service_enabled && /usr/bin/systemctl disable ${_service_name} 2>/dev/null
  fi;
  return 0;
}

# Install systemd service.
_enable_systemd_service() {
  _is_running_systemd || return 0;
  _is_systemd_service_enabled && return 0;
  if `eval ${_service_enable}`; then
    /usr/bin/systemctl enable ${_service_name} 2>/dev/null
  fi;
  return 0;
}

_reload_systemd_service() {
  _is_running_systemd || return;
  /usr/bin/systemctl --system daemon-reload 2>/dev/null
  return 0;
}

# arg 1:  the new package version
pre_install() {
  /bin/true
}

# arg 1:  the new package version
post_install() {
  getent passwd ${_service_username} > /dev/null || /usr/sbin/useradd --user-group --home-dir "${_service_install_dir}" --shell "/bin/bash" ${_service_username} &> /dev/null
  _set_dir_permissions
  _enable_systemd_service
  _start_systemd_service
  echo "    To initialize gerrit, see http://gerrit-documentation.googlecode.com/svn/Documentation/2.8/index.html"
  echo "    To setup gerrit do:"
  echo "      sudo su - gerrit"
  echo "      java -jar /usr/share/java/gerrit/gerrit.war init -d /var/lib/gerrit"
}

# arg 1:  the new package version
# arg 2:  the old package version
pre_upgrade() {
  _stop_systemd_service
  _disable_systemd_service
}

# arg 1:  the new package version
# arg 2:  the old package version
post_upgrade() {
  _set_dir_permissions
  _enable_systemd_service
  _reload_systemd_service
  _start_systemd_service
  echo "    To update gerrit, see http://gerrit-documentation.googlecode.com/svn/ReleaseNotes/ReleaseNotes-2.8.html"
  echo "    To update gerrit do:"
  echo "      sudo su - gerrit"
  echo "      java -jar /usr/share/java/gerrit/gerrit.war init -d /var/lib/gerrit"
}

# arg 1:  the old package version
pre_remove() {
  _stop_systemd_service
  _disable_systemd_service
  return 0;
}

# arg 1:  the old package version
post_remove() {
  getent passwd ${_service_username} > /dev/null && /usr/sbin/userdel ${_service_username} &>/dev/null
  for d in ${_service_cache_dir}; do
    [ -n "${d}" -a -d "${d}" ] && rm -rf "${d}"
  done
  for d in ${_service_install_dir} ${_service_log_dir}; do
    [ -n "${d}" -a -d "${d}" ] && echo ">>> directory ${d} needs to be removed manually"
  done
  return 0;
}

