# Maintainer: alive4ever
pkgname=edk2-ovmf
pkgver=20161105
pkgrel=2
pkgdesc="EDK2 ovmf firmware from Fedora 25 rpm"
arch=('any')
url="https://fedoraproject.org/wiki/Using_UEFI_with_QEMU"
license=('custom:BSD')
optdepends=("qemu: To make use of edk2 ovmf firmware")
source=("http://download.fedoraproject.org/pub/fedora/linux/updates/25/x86_64/e/edk2-ovmf-20161105git3b25ca8-1.fc25.noarch.rpm")
sha256sums=("707c302fa8bc435f610c9aa23d6fdd3de0dc052a8f1c546b58aaf5d8a6dfcf9d")

package() {
	cd "${srcdir}"
	cp -rv ./usr $pkgdir
}
