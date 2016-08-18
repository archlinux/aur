# Maintainer: alive4ever
pkgname=edk2-ovmf
pkgver=20160418
pkgrel=1
pkgdesc="EDK2 ovmf firmware from Fedora 24 rpm"
arch=('any')
url="https://fedoraproject.org/wiki/Using_UEFI_with_QEMU"
license=('custom:BSD')
optdepends=("qemu: To make use of edk2 ovmf firmware")
source=("http://rpmfind.net/linux/fedora/linux/updates/24/x86_64/e/edk2-ovmf-20160418gita8c39ba-4.fc24.noarch.rpm")
sha256sums=("47e66f7ef9ff57f37d2a8bb42c33f79d62fca9f1f787ed3a4d4d241b18edb5cc")

package() {
	cd "${srcdir}"
	cp -rv ./usr $pkgdir
}
