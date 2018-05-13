# Maintainer: robertfoster

pkgname=('ovmf-arm' 'ovmf-aarch64')
pkgbase=ovmf-arm
pkgver=latest
pkgrel=1
arch=('any')
pkgdesc="Tianocore UEFI firmware for qemu ARM/AARCH64."
url="http://sourceforge.net/apps/mediawiki/tianocore/index.php?title=EDK2"
license=('custom')
source=("qemu-arm::http://snapshots.linaro.org/components/kernel/leg-virt-tianocore-edk2-upstream/latest/QEMU-ARM/RELEASE_GCC5/QEMU_EFI.fd"
"qemu-aarch64::http://snapshots.linaro.org/components/kernel/leg-virt-tianocore-edk2-upstream/latest/QEMU-AARCH64/RELEASE_GCC5/QEMU_EFI.fd")

package_ovmf-arm() {

	install -D -m644 "${srcdir}"/qemu-arm "${pkgdir}"/usr/share/ovmf/ARM/QEMU_EFI.fd
}

package_ovmf-aarch64() {

	install -D -m644 "${srcdir}"/qemu-aarch64 "${pkgdir}"/usr/share/ovmf/AARCH64/QEMU_EFI.fd
}

md5sums=('SKIP'
'SKIP')