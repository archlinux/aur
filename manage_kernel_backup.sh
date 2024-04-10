#!/usr/bin/env bash

set -eu

if [ -n "${KERNEL_HOOK_DEBUG:-""}" ]; then
  set -x
fi

declare -a SUPPORTED_KERNEL_PACKAGES
SUPPORTED_KERNEL_PACKAGES=("custom" "linux" "linux-lts")

declare -A KERNEL_IMAGES
KERNEL_IMAGES["custom"]="vmlinuz" # Fake entry, custom build scripts do not create an unversioned kernel image
KERNEL_IMAGES["linux"]="vmlinuz-linux"
KERNEL_IMAGES["linux-lts"]="vmlinuz-linux-lts"

declare -A INITRAMFS_IMAGES
INITRAMFS_IMAGES["custom"]="initramfs.img" # Fake entry, custom build scripts do not create an unversioned initramfs image
INITRAMFS_IMAGES["linux"]="initramfs-linux.img"
INITRAMFS_IMAGES["linux-lts"]="initramfs-linux-lts.img"

KERNEL_DIRECTORY="/boot"
MODULES_DIRECTORY="/usr/lib/modules"

_is_running_package_kernel() {
  package="${1}"
  if [ "${package}" == custom ]; then
    return 1
  fi
  kernel_image="${KERNEL_IMAGES[$package]}"
  cd "${KERNEL_DIRECTORY}"
  if [ ! -e "${kernel_image}" ]; then
    return 1
  fi
  kernel_version="$(_kernel_version_from_image "${package}" "${kernel_image}")"
  running_version="$(uname -r)"
  if [ "${kernel_version}" == "${running_version}" ]; then
    echo "Running kernel is from package ${package}, backup needed" >&2
    return 0
  else
    echo "Running kernel is not from package ${package}, no backup needed" >&2
    return 1
  fi
}

_update_grub_cfg() {
  grub-mkconfig -o /boot/grub/grub.cfg
}

_validate_version_string() {
  kernel_version_raw="${1}"
  if [[ "${kernel_version_raw}" =~ ^[^0-9] ]]; then
    return 1
  fi
  kernel_version="$(echo "${kernel_version_raw}" | tr -cd '[:alnum:]._-')"
  if [ "${kernel_version_raw}" != "${kernel_version}" ]; then
    return 1
  fi
  return 0
}

_kernel_version_from_image() {
  package="${1}"
  file="${2}"
  kernel_version="$(file -bL "${file}" | head -n1 | sed -e 's/.*version //' -e 's/ (.*//')"
  if _validate_version_string "${kernel_version}"; then
    echo "${kernel_version}"
  else
    echo "Invalid version string ${kernel_version} for ${kernel_image}" >&2
  fi
}

_kernel_version_from_kernel_file_name() {
  package="${1}"
  file="${2}"
  base="${KERNEL_IMAGES[$package]}"
  kernel_version="${file/#"${base}-"/}"
  if _validate_version_string "${kernel_version}"; then
    if [ -f "${file}" ]; then
      kernel_version_from_image="$(_kernel_version_from_image "${package}" "${file}")"
      if [ "${kernel_version_from_image}" != "${kernel_version}" ]; then
        echo "Version string mismatch for kernel image ${file}, got ${kernel_version} from file name and ${kernel_version_from_image} from image" >&2
        return 1
      fi
    fi
    echo "${kernel_version}"
  else
    echo "Invalid version string ${kernel_version} from file name ${file}" >&2
    return 1
  fi
}

_kernel_version_from_initramfs_file_name() {
  package="${1}"
  file="${2}"
  base="${INITRAMFS_IMAGES[$package]}"
  base="${base/%.img/}"
  file="${file/%.img/}"
  kernel_version="${file/#"${base}-"/}"
  if _validate_version_string "${kernel_version}"; then
    echo "${kernel_version}"
  else
    echo "Invalid version string ${kernel_version} from file name ${file}" >&2
    return 1
  fi
}

_versioned_kernel_file_name() {
  package="${1}"
  version="${2}"
  base="${KERNEL_IMAGES[$package]}"
  versioned_file_name="${base}-${version}"
  version_from_file="$(_kernel_version_from_kernel_file_name "${package}" "${versioned_file_name}")"
  if [ "${version_from_file}" != "${version}" ]; then
    echo "Unable to extract version from generated file name, used ${version} got ${version_from_file}" >&2
    return 1
  fi
  echo "${versioned_file_name}"
}

_versioned_initramfs_file_name() {
  package="${1}"
  version="${2}"
  base="${INITRAMFS_IMAGES[$package]}"
  base="${base/%.img/}"
  versioned_file_name="${base}-${version}.img"
  version_from_file="$(_kernel_version_from_initramfs_file_name "${package}" "${versioned_file_name}")"
  if [ "${version_from_file}" != "${version}" ]; then
    echo "Unable to extract version from generated file name, used ${version} got ${version_from_file}" >&2
    return 1
  fi
  echo "${versioned_file_name}"
}

_delete_kernel_version() {
  package="${1}"
  file="${2}"
  version="${3}"
  full_removal="${4:-0}"
  initramfs_image="${INITRAMFS_IMAGES[$package]}"
  [ -f "${file}" ] && rm "${file}"
  versioned_initramfs_file="$(_versioned_initramfs_file_name "${package}" "${version}")"
  [ -f "${versioned_initramfs_file}" ] && rm "${versioned_initramfs_file}"
  if [[ ${full_removal} -ne 0 ]]; then
    modules_dir="${MODULES_DIRECTORY}/${version}"
    if [ -d "${modules_dir}" ]; then
      rm -R "${modules_dir}"
    fi
    if which dkms &> /dev/null; then
      dkms status -k "${version}" | grep -v ": added$" | sed -e 's/, .*//' | while read -r mod; do
        echo "dkms remove ${mod} -k ${version}"
        dkms remove "${mod}" -k "${version}" || echo "DKMS returned an error"
      done
    fi
  fi
}

create_kernel_backup() {
  package="${1}"
  kernel_image="${KERNEL_IMAGES[$package]}"
  initramfs_image="${INITRAMFS_IMAGES[$package]}"
  cd "${KERNEL_DIRECTORY}"
  if [ ! -e "${kernel_image}" ]; then
    echo "Kernel image ${kernel_image} for kernel package ${package} does not exist"
    return 1
  fi
  kernel_version="$(_kernel_version_from_image "${package}" "${kernel_image}")"
  versioned_kernel_file_name="$(_versioned_kernel_file_name "${package}" "${kernel_version}")"
  if [ ! -e "${versioned_kernel_file_name}" ]; then
    cp "${kernel_image}" "${versioned_kernel_file_name}"
  fi
  versioned_initramfs_file_name="$(_versioned_initramfs_file_name "${package}" "${kernel_version}")"
  cp "${initramfs_image}" "${versioned_initramfs_file_name}"
  echo "Created backup for kernel package ${package} with version ${kernel_version}" >&2
}

create_initramfs_backup() {
  package="${1}"
  kernel_image="${KERNEL_IMAGES[$package]}"
  initramfs_image="${INITRAMFS_IMAGES[$package]}"
  cd "${KERNEL_DIRECTORY}"
  if [ ! -e "${kernel_image}" ]; then
    return 0
  fi
  kernel_version="$(_kernel_version_from_image "${package}" "${kernel_image}")"
  versioned_initramfs_file_name="$(_versioned_initramfs_file_name "${package}" "${kernel_version}")"
  if [ -f "${initramfs_image}" ]; then
    cp "${initramfs_image}" "${versioned_initramfs_file_name}"
    echo "Created backup for initramfs iamge for kernel ${package} with version ${kernel_version}" >&2
  fi
}

clean_backups() {
  package="${1}"
  kernel_image="${KERNEL_IMAGES[$package]}"
  running_version="$(uname -r)"
  installed_version="_"
  cd "${KERNEL_DIRECTORY}"
  if [ -e "${kernel_image}" ]; then
    installed_version="$(_kernel_version_from_image "${package}" "${kernel_image}")"
  fi
  declare -i keep=0
  declare -a clean=()

  declare -a kernel=()
  # shellcheck disable=SC2012
  mapfile -t kernel < <(ls -1 "${kernel_image}"-[0-9]* 2> /dev/null | sort -r)
  for k in "${kernel[@]}"; do
    v="$(_kernel_version_from_kernel_file_name "${package}" "${k}")"
    if [ "${v}" == "${installed_version}" ]; then
      keep+=1
      continue
    fi
    if [ "${v}" == "${running_version}" ]; then
      keep+=1
      continue
    fi
  done
  for k in "${kernel[@]}"; do
    if [ "${v}" == "${installed_version}" ]; then
      continue
    fi
    if [ "${v}" == "${running_version}" ]; then
      continue
    fi
    if [ ${keep} -lt 2 ]; then
      keep+=1
      continue
    fi
    clean+=("${k}")
  done

  if [ ${#clean[@]} -gt 0 ]; then
    for k in "${clean[@]}"; do
      v="$(_kernel_version_from_kernel_file_name "${package}" "${k}")"
      _delete_kernel_version "${package}" "${k}" "${v}" 1
    done
  fi
}

remove_backups() {
  package="${1}"
  kernel_image="${KERNEL_IMAGES[$package]}"
  installed_version="_"
  cd "${KERNEL_DIRECTORY}"
  if [ -e "${kernel_image}" ]; then
    installed_version="$(_kernel_version_from_image "${package}" "${kernel_image}")"
  fi
  # shellcheck disable=SC2012
  for k in $(ls -1 "${kernel_image}"-[0-9]* 2> /dev/null | sort -r); do
    v="$(_kernel_version_from_kernel_file_name "${package}" "${k}")"
    if [ "${v}" == "${installed_version}" ]; then
      _delete_kernel_version "${package}" "${k}" "${v}" 0
    else
      _delete_kernel_version "${package}" "${k}" "${v}" 1
    fi
  done
}

create_modules_backup() {
  package="${1}"
  kernel_image="${KERNEL_IMAGES[$package]}"
  cd "${KERNEL_DIRECTORY}"
  kernel_version="$(_kernel_version_from_image "${package}" "${kernel_image}")"
  cd "${MODULES_DIRECTORY}"
  mkdir -p backup
  if [ -d "${kernel_version}" ]; then
    if [ -d "backup/${kernel_version}" ]; then
      echo "Backup for modules for kernel ${kernel_version} found. Cleaning up" >&2
      rm -R "backup/${kernel_version}"
    fi
    cp -al "${kernel_version}" backup/
  else
    echo "No modules for kernel ${kernel_version} found." >&2
  fi
  create_dkms_backup "${p}"
}

create_dkms_backup() {
  # No DKMS backup creation, relying on rebuild instead of restore
  return 0
}

restore_modules_backup() {
  package="${1}"
  cd "${MODULES_DIRECTORY}"
  if [ -d "backup" ]; then
    cd backup
    declare -a versions
    # shellcheck disable=SC2012 disable=SC2010
    mapfile -t versions < <(ls -1 | grep "[0-9]*" | sort -r)
    for v in "${versions[@]}"; do
      if [ -d "${v}" ]; then
        if [ -d "../${v}" ]; then
          echo "Modules for kernel ${v} already restored but still backed up. Trying again" >&2
          rm -R "../${v}"
        fi
        cp -al "${v}" ../
        rm -R "${v}"
        restore_dkms_backup "${p}" "${v}"
      else
        echo "Module backup for kernel ${v} is not a directory. Ignoring" >&2
      fi
    done
  fi
}

restore_dkms_backup() {
  kernel_version="${2}"
  dkms autoinstall -k "${kernel_version}" || true
}


# check for root to avoid endless error messages
if (( EUID )); then
  echo 'You must be root to use this hook' >&2
  exit 1
fi

action="${1:-""}"
declare -a packages=()

while read -r package; do
  for p in "${SUPPORTED_KERNEL_PACKAGES[@]}"; do
    if [[ "${p}" == "${package}" ]]; then
      if [ -n "${KERNEL_IMAGES[$package]}" ] && [ -n "${INITRAMFS_IMAGES[$package]}" ]; then
        packages+=("${package}")
        break
      fi
    fi
  done
done

case "${action}" in
  create)
    for p in "${packages[@]}"; do
      if [ "${p}" == "custom" ]; then
        continue
      fi
      if _is_running_package_kernel "${p}"; then
        create_kernel_backup "${p}"
        _update_grub_cfg
      fi
    done
    ;;
  remove)
    for p in "${packages[@]}"; do
      if [ "${p}" == "custom" ]; then
        continue
      fi
      remove_backups "${p}"
    done
    ;;
  modules_backup)
    for p in "${packages[@]}"; do
      if [ "${p}" == "custom" ]; then
        continue
      fi
      if _is_running_package_kernel "${p}"; then
        create_modules_backup "${p}"
      fi
    done
    ;;
  modules_restore)
    for p in "${packages[@]}"; do
      if [ "${p}" == "custom" ]; then
        continue
      fi
      if _is_running_package_kernel "${p}"; then
        restore_modules_backup "${p}"
      fi
    done
    ;;
  mkinitcpio)
    if [ ${#packages[@]} -eq 0 ]; then
      for p in "${SUPPORTED_KERNEL_PACKAGES[@]}"; do
        if [ "${p}" == "custom" ]; then
          continue
        fi
        if _is_running_package_kernel "${p}"; then
          create_initramfs_backup "${p}"
        fi
      done
      _update_grub_cfg
    else
      for p in "${packages[@]}"; do
        if [ "${p}" == "custom" ]; then
          continue
        fi
        if _is_running_package_kernel "${p}"; then
          create_initramfs_backup "${p}"
        fi
      done
      _update_grub_cfg
    fi
    ;;
  clean)
    if [ ${#packages[@]} -eq 0 ]; then
      for p in "${SUPPORTED_KERNEL_PACKAGES[@]}"; do
        if [ "${p}" == "custom" ]; then
          continue
        fi
        if _is_running_package_kernel "${p}"; then
          clean_backups "${p}"
        else
          remove_backups "${p}"
        fi
      done
    else
      for p in "${packages[@]}"; do
        if [ "${p}" == "custom" ]; then
          continue
        fi
        if _is_running_package_kernel "${p}"; then
          clean_backups "${p}"
        else
          remove_backups "${p}"
        fi
      done
    fi
    ;;
esac
