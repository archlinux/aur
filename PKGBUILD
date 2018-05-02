# Maintainer: alive4ever
pkgname=edk2-ovmf
pkgver=20171011
_githash=92d07e4
_relnum=3
_fedoraversion=28
pkgrel=3
pkgdesc="EDK2 ovmf firmware from Fedora $_fedoraversion rpm"
arch=('any')
url="https://fedoraproject.org/wiki/Using_UEFI_with_QEMU"
license=('custom:BSD')
optdepends=("qemu: To make use of edk2 ovmf firmware")
source=("http://download.fedoraproject.org/pub/fedora/linux/releases/$_fedoraversion/Everything/x86_64/os/Packages/e/edk2-ovmf-${pkgver}git${_githash}-${_relnum}.fc$_fedoraversion.noarch.rpm"
	"http://download.fedoraproject.org/pub/fedora/linux/releases/$_fedoraversion/Everything/x86_64/os/Packages/e/edk2-ovmf-ia32-${pkgver}git${_githash}-${_relnum}.fc$_fedoraversion.noarch.rpm")
sha256sums=('96f1afacc5f58182f74e2f5137a296a71cd2275d023b214ee8a0096eb98a787e'
            '1473db323ea7e6fe979b11fbe6cc603291440acc994bacfbea2f0db3a8caeddc')

package() {
	cd "${srcdir}"
	cp -rv ./usr $pkgdir
}
