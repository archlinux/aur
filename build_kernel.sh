#!/bin/bash -e

[ ! -f "/etc/default/arch-efiboot" ] || . /etc/default/arch-efiboot

BOOTDIR="${BOOTDIR:=/boot}"
ESP="${ESP:=${BOOTDIR}/efi}"
CMDLINE_DIR="${CMDLINE_DIR:=${BOOTDIR}}"
UCODES=("amd-ucode.img" "intel-ucode.img")
case "$(uname -m)" in
  x86_64)  readonly STUB_ARCH="x64";;
  i686)    readonly STUB_ARCH="ia32";;
  aarch64) readonly STUB_ARCH="aa64";;
  arm*)    readonly STUB_ARCH="arm";;
esac

EFISTUB="${EFISTUB:=/usr/lib/systemd/boot/efi/linux${STUB_ARCH}.efi.stub}"
mkdir -p "${ESP}/EFI/Arch"
echo "Updating EFI kernels..."

for k in "${BOOTDIR}/vmlinuz-"*; do
  NAME="${k##*vmlinuz-}"
  echo "  Building ${NAME}"

    (cat ${UCODES[@]/#/${BOOTDIR}/} "${BOOTDIR}/initramfs-${NAME}-fallback.img" 2>/dev/null ||:) > /tmp/initrd.bin

  [ ! -f "${CMDLINE_DIR}/cmdline.txt" ] || CMDLINE="${CMDLINE_DIR}/cmdline.txt"  # try generic cmdline first
  [ ! -f "${CMDLINE_DIR}/cmdline-${NAME}.txt" ] || CMDLINE="${CMDLINE_DIR}/cmdline-${NAME}.txt"  # if there's a kernel-specific one, use that
  if [ ! -f "${CMDLINE}" ]; then  # when neither cmdline exists, generate it from running one
    CMDLINE="$(mktemp)"  # CMDLINE="${CMDLINE_DIR}/cmdline.txt"
    # the first sed expression is a little wonky and doesn't work (yet!)
    sed -E \
      -e 's/(^|[[:space:]]*)BOOT_IMAGE=(['\''"])[^'\''"]*\2($|[[:space:]]*)/\1/' \
      -e 's/(^|[[:space:]]*)BOOT_IMAGE=[^[:space:]]*($|[[:space:]]*)/\1/' \
      /proc/cmdline > "${CMDLINE}"
  fi

  osrel_offset="$(objdump -h "${EFISTUB}" | awk 'NF==7 {size=strtonum("0x"$3); offset=strtonum("0x"$4)} END {print size + offset}')"
  kernel_offset="$((osrel_offset+$(stat -Lc%s /etc/os-release)))"
  initrd_offset="$((kernel_offset+$(stat -Lc%s "${k}")))"
  cmdline_offset="$((initrd_offset+$(stat -Lc%s /tmp/initrd.bin)))"

  mkdir -p "${ESP}/EFI/ArchLinux"
  objcopy \
    --add-section .osrel="/usr/lib/os-release" --change-section-vma .osrel="$(printf 0x%x "$osrel_offset")" \
    --add-section .linux="${k}" --change-section-vma .linux="$(printf 0x%x "$kernel_offset")" \
    --add-section .initrd="/tmp/initrd.bin" --change-section-vma .initrd="$(printf 0x%x "$initrd_offset")" \
    --add-section .cmdline="${CMDLINE}" --change-section-vma .cmdline="$(printf 0x%x "$cmdline_offset")" \
    "${EFISTUB}" "${ESP}/EFI/ArchLinux/${NAME}.efi"
done

if [ "${SETNEXT:-0}" -ne 0 ]; then
  CURRENT="$(sed -E -e 's/(^|.*[[:space:]])BOOT_IMAGE=(['\''"])([^'\''"]*)\2($|[[:space:]].*)/\3/' -e 's/(^|.*[[:space:]])BOOT_IMAGE=([^[:space:]]*)($|[[:space:]].*)/\2/' /proc/cmdline)"
  cp "${ESP}/EFI/ArchLinux/${CURRENT##*vmlinuz-}.efi" "${ESP}/EFI/BOOT/BOOT${STUB_ARCH^^}.EFI"
fi
