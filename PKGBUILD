# Maintainer: alive4ever
pkgname=edk2-ovmf
pkgver=20160418
pkgrel=2
pkgdesc="EDK2 ovmf firmware from Fedora 24 rpm"
arch=('any')
url="https://fedoraproject.org/wiki/Using_UEFI_with_QEMU"
license=('custom:BSD')
optdepends=("qemu: To make use of edk2 ovmf firmware")
source=("http://rpmfind.net/linux/fedora/linux/updates/24/x86_64/e/edk2-ovmf-20160418gita8c39ba-5.fc24.noarch.rpm")
sha256sums=("ad7f92d85ac32737d33aca83996b3def01994953e4871e881d79c71895bb2c81")

package() {
	cd "${srcdir}"
	cp -rv ./usr $pkgdir
}
