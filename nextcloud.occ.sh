#!/usr/bin/env bash

readonly default_config="/etc/php-legacy/php.ini"
readonly default_php_command="/usr/bin/php-legacy"
readonly default_user="nextcloud"
readonly preserved_environment_vars="NEXTCLOUD_CONFIG_DIR"

config=""
php_command=""
user=""

check_sudo() {
  if ! command -v sudo > /dev/null; then
    printf "The sudo command is not available.\n"
    exit 1
  fi
}

# allow overriding the php.ini
if [[ -n "${NEXTCLOUD_PHP_CONFIG}" ]] && [[ -f "${NEXTCLOUD_PHP_CONFIG}" ]]; then
  config="${NEXTCLOUD_PHP_CONFIG}"
else
  config="${default_config}"
fi

# allow overriding the php executable
if [[ -n "${NEXTCLOUD_PHP}" ]] && command -v "${NEXTCLOUD_PHP}" > /dev/null; then
  php_command="${NEXTCLOUD_PHP}"
else
  php_command="${default_php_command}"
fi

# allow overriding the user to run as
if [[ -n "${NEXTCLOUD_USER}" ]] && id "${NEXTCLOUD_USER}" > /dev/null 2>&1; then
  user="${NEXTCLOUD_USER}"
else
  user="${default_user}"
fi

if [[ "${UID}" -eq 0 ]]; then
  runuser --whitelist-environment="${preserved_environment_vars}" -u "$user" -- "$php_command" -c "${config}" /usr/share/webapps/nextcloud/occ "$@"
else
  check_sudo
  sudo --preserve-env="${preserved_environment_vars}" -u "$user" "$php_command" -c "${config}" /usr/share/webapps/nextcloud/occ "$@"
fi
