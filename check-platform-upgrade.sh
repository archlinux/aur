#!/usr/bin/env bash
# SPDX-FileCopyrightText: 2026 Ragu Manjegowda
# SPDX-License-Identifier: MIT
# Run from a normal user terminal: bash check-platform-upgrade.sh test
set -euo pipefail
shopt -s nullglob

root=$(realpath -- "$(dirname -- "${BASH_SOURCE[0]}")")
mode=${1:-test}
work="$root/rollback/wireplumber-0.5.18"
backup="$root/rollback/pre-upgrade-$(date +%Y-%m-%d-%H%M%S)"
override=
restore_needed=false
since=

die() { printf 'ERROR: %s\n' "$*" >&2; exit 1; }

cleanup() {
  local status=$?
  trap - EXIT INT TERM
  if $restore_needed; then
    if [[ -n "$since" ]]; then
      journalctl --user -u wireplumber.service --since "$since" --no-pager \
        > "$backup/wireplumber-test.log" || true
    fi
    printf '\nRestoring the installed WirePlumber service...\n'
    if ! rm -f -- "$override" || ! systemctl --user daemon-reload ||
       ! systemctl --user restart wireplumber.service; then
      printf 'Restore failed. Remove %s and restart wireplumber.service manually.\n' "$override" >&2
      status=1
    fi
    wpctl status > "$backup/wpctl-restored.txt" || true
  fi
  exit "$status"
}
trap cleanup EXIT
trap 'exit 130' INT
trap 'exit 143' TERM
trap 'exit 129' HUP

download() {
  local package=$1 version=$2 directory=$3 architecture=${4:-x86_64}
  local filename="$package-$version-$architecture.pkg.tar.zst"
  local url="https://archive.archlinux.org/packages/${package:0:1}/$package/$filename"
  mkdir -p -- "$directory"
  if [[ ! -s "$directory/$filename" ]]; then
    curl --fail --location --retry 3 --output "$directory/$filename.part" "$url"
    mv -- "$directory/$filename.part" "$directory/$filename"
  fi
  if [[ ! -s "$directory/$filename.sig" ]]; then
    curl --fail --location --retry 3 --output "$directory/$filename.sig.part" "$url.sig"
    mv -- "$directory/$filename.sig.part" "$directory/$filename.sig"
  fi
  # Verify against the distribution keyring without altering the user's keyring.
  mkdir -p -- "$work/gnupg"
  chmod 700 "$work/gnupg"
  gpg --homedir "$work/gnupg" --batch --quiet \
    --import /usr/share/pacman/keyrings/archlinux.gpg
  gpg --homedir "$work/gnupg" --batch \
    --verify "$directory/$filename.sig" "$directory/$filename"
}

stage() {
  for package in wireplumber libwireplumber; do
    download "$package" 0.5.18-1 "$work/packages"
  done
  mkdir -p -- "$work/root"
  for archive in "$work/packages/"*.pkg.tar.zst; do
    bsdtar -xf "$archive" -C "$work/root"
  done
  LD_LIBRARY_PATH="$work/root/usr/lib" "$work/root/usr/bin/wireplumber" --version
}

preserve() {
  # Refuse to interrupt the service until exact installed rollback versions exist.
  pacman -Q linux linux-headers wireplumber libwireplumber >/dev/null
  mkdir -p -- "$backup"
  cp -p -- /etc/pacman.conf "$backup/pacman.conf"
  pacman -Q > "$backup/installed-packages.txt"
  uname -r > "$backup/running-kernel.txt"
  wpctl status > "$backup/wpctl-before.txt"
  for archive in "$root/"*.pkg.tar.zst; do
    cp -p -- "$archive" "$backup/"
  done
  local packages=(linux linux-headers wireplumber libwireplumber
    intel-vision-drivers-dkms-ipu7-ov08x40 ipu-bridge-legacy-cvs-dkms
    libcamera-ipu7-ov08x40 libcamera-ipu7-ov08x40-ipa
    v4l2-relayd-ipu7-ov08x40 v4l2loopback-dkms)
  local package version archive_version archive_architecture archive found
  for package in "${packages[@]}"; do
    if ! version=$(pacman -Q "$package" 2>/dev/null); then
      continue
    fi
    version=${version#* }
    archive_version=${version#*:}
    found=false
    for archive in "$backup/$package-$archive_version-"*.pkg.tar.zst \
        /var/cache/pacman/pkg/"$package-$archive_version-"*.pkg.tar.zst; do
      [[ $(pacman -Qp "$archive" 2>/dev/null) == "$package $version" ]] || continue
      if [[ "$archive" != "$backup/"* ]]; then
        cp -p -- "$archive" "$backup/"
        if [[ -f "$archive.sig" ]]; then cp -p -- "$archive.sig" "$backup/"; fi
      fi
      found=true
      break
    done
    if ! $found; then
      case "$package" in
        linux|linux-headers|wireplumber|libwireplumber|v4l2loopback-dkms)
          archive_architecture=x86_64
          if [[ "$package" == v4l2loopback-dkms ]]; then archive_architecture=any; fi
          download "$package" "$archive_version" "$backup" "$archive_architecture"
          [[ $(pacman -Qp "$backup/$package-$archive_version-$archive_architecture.pkg.tar.zst") == "$package $version" ]] ||
            die "Downloaded rollback package does not match $package $version"
          ;;
        *) die "Missing rollback archive for $package $version; service has not been changed" ;;
      esac
    fi
  done
  # The test gets a private copy of state, preserving saved audio profiles/volumes.
  local state=${XDG_STATE_HOME:-$HOME/.local/state}/wireplumber
  if [[ -d "$state" ]]; then cp -a -- "$state" "$backup/wireplumber-state"; fi
  (cd "$backup" && sha256sum -- *.pkg.tar.zst > SHA256SUMS)
  printf 'Rollback packages and configuration: %s\n' "$backup"
}

test_wireplumber() {
  [[ -t 0 ]] || die 'Run the hardware test interactively in your normal terminal'
  systemctl --user is-active --quiet wireplumber.service || die 'WirePlumber service is not active'
  preserve
  stage

  # Retain user/system config fragments, using the new upstream config/scripts.
  local config="${XDG_CONFIG_HOME:-$HOME/.config}/wireplumber"
  local directory
  IFS=: read -ra directories <<< "${XDG_CONFIG_DIRS:-/etc/xdg}"
  for directory in "${directories[@]}"; do config+=":$directory/wireplumber"; done
  config+=":/etc/wireplumber"
  IFS=: read -ra directories <<< "${XDG_DATA_DIRS:-/usr/local/share:/usr/share}"
  for directory in "${directories[@]}"; do
    [[ "$directory" == /usr/share ]] || config+=":$directory/wireplumber"
  done
  config+=":$work/root/usr/share/wireplumber:/usr/share/wireplumber"
  local state="$backup/test-state"
  mkdir -p -- "$state"
  if [[ -d "$backup/wireplumber-state" ]]; then
    cp -a -- "$backup/wireplumber-state" "$state/wireplumber"
  fi
  override="${XDG_RUNTIME_DIR:?}/systemd/user/wireplumber.service.d/99-ipu7-upgrade-test.conf"
  [[ ! -e "$override" ]] || die "An existing test override is present: $override"
  # Paths are quoted below; reject systemd expansion/escape characters.
  case "$work$config$state" in
    *'%'*|*'"'*|*'\'*|*$'\n'*) die 'Unsupported systemd quoting character in test paths' ;;
  esac
  mkdir -p -- "$(dirname -- "$override")"
  restore_needed=true
  cat > "$override" <<EOF
[Service]
ExecStart=
ExecStart="$work/root/usr/bin/wireplumber"
Environment="LD_LIBRARY_PATH=$work/root/usr/lib"
Environment="WIREPLUMBER_MODULE_DIR=$work/root/usr/lib/wireplumber-0.5"
Environment="WIREPLUMBER_DATA_DIR=$work/root/usr/share/wireplumber"
Environment="WIREPLUMBER_CONFIG_DIR=$config"
Environment="XDG_STATE_HOME=$state"
EOF
  since=$(date --iso-8601=seconds)
  systemctl --user daemon-reload
  systemctl --user restart wireplumber.service
  sleep 8
  systemctl --user is-active --quiet wireplumber.service || die 'WirePlumber 0.5.18 failed to start'
  wpctl status | tee "$backup/wpctl-test.txt"
  printf '\nWirePlumber 0.5.18 is now running from the extracted packages.\n'
  printf 'Test Built-in Front Camera in Firefox, speaker playback, microphones, and any Bluetooth headset.\n'
  printf 'Press Enter when finished; the installed WirePlumber will be restored.\n'
  read -r
  journalctl --user -u wireplumber.service --since "$since" --no-pager > "$backup/wireplumber-test.log"
  printf 'Test logs: %s\n' "$backup"
}

check_kernel() {
  local kernel=7.2.9-arch1-1
  local kernel_work="$root/rollback/linux-7.2.9"
  download linux-headers 7.2.9.arch1-1 "$kernel_work/packages"
  mkdir -p -- "$kernel_work/root" "$kernel_work/build"
  bsdtar -xf "$kernel_work/packages/linux-headers-7.2.9.arch1-1-x86_64.pkg.tar.zst" \
    -C "$kernel_work/root"
  local headers="$kernel_work/root/usr/lib/modules/$kernel/build"
  [[ $(make -s -C "$headers" kernelrelease) == "$kernel" ]] || die 'Unexpected kernel header version'
  local module source destination build_directory
  build_directory=$(mktemp -d "$kernel_work/build/check-XXXXXXXX")
  for module in ipu-bridge-legacy-cvs vision-drivers v4l2loopback; do
    local sources=(/usr/src/"$module-"*)
    [[ ${#sources[@]} == 1 ]] || die "Expected one installed source directory for $module"
    source=${sources[0]}
    destination="$build_directory/${source##*/}"
    cp -a -- "$source" "$destination"
    printf '\nBuilding %s against %s...\n' "$module" "$kernel"
    if [[ "$module" == v4l2loopback ]]; then
      make -j4 -C "$destination" KERNEL_DIR="$headers" v4l2loopback \
        2>&1 | tee "$kernel_work/$module-build.log"
    else
      make -j4 -C "$destination" KERNELRELEASE="$kernel" KERNEL_SRC="$headers" \
        2>&1 | tee "$kernel_work/$module-build.log"
    fi
  done
  printf '\nCamera module builds passed for %s. No modules were installed or loaded.\n' "$kernel"
}

case "$mode" in
  stage) stage ;;
  backup) preserve ;;
  test) test_wireplumber ;;
  kernel-check) check_kernel ;;
  *) die 'Usage: bash check-platform-upgrade.sh [stage|backup|test|kernel-check]' ;;
esac
