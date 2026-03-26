#!/usr/bin/env bash

set -euo pipefail

readonly template_dir='/opt/pjecalc-cidadao/app-dist'
readonly data_home="${XDG_DATA_HOME:-${HOME}/.local/share}"
readonly state_dir="${data_home}/pjecalc-cidadao"
readonly app_dir="${state_dir}/app"
readonly user_log_dir="${state_dir}/logs"

mkdir -p "${state_dir}" "${user_log_dir}"

if [[ ! -d "${app_dir}" ]]; then
  cp -a "${template_dir}" "${app_dir}"
else
  rsync -a --delete \
    --exclude '.dados/' \
    --exclude 'tomcat/logs/' \
    --exclude 'tomcat/work/' \
    "${template_dir}/" "${app_dir}/"
fi

mkdir -p "${app_dir}/.dados" "${app_dir}/tomcat/logs" "${app_dir}/tomcat/work"

cd "${app_dir}"

exec "${app_dir}/bin/jre-linux/bin/java" \
  -splash:pjecalc_splash.gif \
  -Duser.timezone=GMT-3 \
  -Dfile.encoding=ISO-8859-1 \
  -Dseguranca.pjecalc.tokenServicos=pW4jZ4g9VM5MCy6FnB5pEfQe \
  -Dseguranca.pjekz.servico.contexto=https://pje.trtXX.jus.br/pje-seguranca \
  -Xms1024m \
  -Xmx2048m \
  -jar "${app_dir}/bin/pjecalc.jar" \
  "$@"
