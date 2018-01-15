# Maintainer: alive4ever
pkgname=edk2-ovmf
pkgver=20170209
_githash=296153c5
_relnum=5
_fedoraversion=27
pkgrel=3
pkgdesc="EDK2 ovmf firmware from Fedora $_fedoraversion rpm"
arch=('any')
url="https://fedoraproject.org/wiki/Using_UEFI_with_QEMU"
license=('custom:BSD')
optdepends=("qemu: To make use of edk2 ovmf firmware")
source=("http://download.fedoraproject.org/pub/fedora/linux/releases/$_fedoraversion/Everything/x86_64/os/Packages/e/edk2-ovmf-${pkgver}git${_githash}-${_relnum}.fc$_fedoraversion.noarch.rpm"
	"http://download.fedoraproject.org/pub/fedora/linux/releases/$_fedoraversion/Everything/x86_64/os/Packages/e/edk2-ovmf-ia32-${pkgver}git${_githash}-${_relnum}.fc$_fedoraversion.noarch.rpm")
sha256sums=('914755cb33a847796a85083557b4ccde9ab4466888c505c56ecfefeb7c05602e'
            '1c69fc078ece55438c6d1c26ae5a28485341a804260344143178a13ab401b058')

package() {
	cd "${srcdir}"
	cp -rv ./usr $pkgdir
}
