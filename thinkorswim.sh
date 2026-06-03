#!/usr/bin/env bash
set -euo pipefail

seed_dir=/usr/lib/thinkorswim-bin/thinkorswim
seed_marker=/usr/lib/thinkorswim-bin/pkgver
fake_os_release=/usr/lib/thinkorswim-bin/os-release
app_args=("$@")

if [[ -z "${HOME:-}" ]]; then
  printf 'thinkorswim: HOME is not set\n' >&2
  exit 1
fi

if [[ -n "${THINKORSWIM_HOME:-}" ]]; then
  runtime_dir=${THINKORSWIM_HOME}
else
  data_home=${XDG_DATA_HOME:-"${HOME}/.local/share"}
  runtime_dir=${data_home}/thinkorswim
fi

find_java21_home() {
  local dir version

  if [[ -n "${THINKORSWIM_JAVA_HOME:-}" && -x "${THINKORSWIM_JAVA_HOME}/bin/java" ]]; then
    printf '%s\n' "${THINKORSWIM_JAVA_HOME}"
    return 0
  fi

  for dir in /usr/lib/jvm/java-21-openjdk /usr/lib/jvm/zulu-21 /usr/lib/jvm/java-21* /usr/lib/jvm/*21*; do
    [[ -x "${dir}/bin/java" ]] || continue
    version=$("${dir}/bin/java" -version 2>&1 | sed -n 's/.*version "\([^"]*\)".*/\1/p' | head -n 1)
    [[ "${version}" == 21* ]] || continue
    printf '%s\n' "${dir}"
    return 0
  done

  return 1
}

java_home=$(find_java21_home) || {
  printf 'thinkorswim: Java 21 was not found. Install jre21-openjdk or set THINKORSWIM_JAVA_HOME.\n' >&2
  exit 1
}

if [[ "${THINKORSWIM_RESET:-0}" == 1 ]]; then
  rm -rf -- "${runtime_dir}"
fi

if [[ ! -x "${runtime_dir}/thinkorswim" ]]; then
  mkdir -p -- "$(dirname -- "${runtime_dir}")"
  cp -a -- "${seed_dir}" "${runtime_dir}"
  if [[ -f "${seed_marker}" ]]; then
    cp -f -- "${seed_marker}" "${runtime_dir}/.arch-package-seed"
  fi
fi

export INSTALL4J_JAVA_HOME_OVERRIDE="${java_home}"

cd -- "${runtime_dir}"

if [[ "${THINKORSWIM_OS_RELEASE_SHIM:-1}" != 0 && -r "${fake_os_release}" ]]; then
  exec bwrap \
    --bind / / \
    --dev-bind /dev /dev \
    --proc /proc \
    --ro-bind "${fake_os_release}" /etc/os-release \
    "${runtime_dir}/thinkorswim" "${app_args[@]}"
fi

exec "${runtime_dir}/thinkorswim" "${app_args[@]}"
