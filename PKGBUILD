# Maintainer: alive4ever
pkgname=edk2-ovmf
pkgver=20170209
_githash=296153c5
_relnum=3
pkgrel=1
pkgdesc="EDK2 ovmf firmware from Fedora 26 rpm"
arch=('any')
url="https://fedoraproject.org/wiki/Using_UEFI_with_QEMU"
license=('custom:BSD')
optdepends=("qemu: To make use of edk2 ovmf firmware")
source=("http://download.fedoraproject.org/pub/fedora/linux/updates/testing/26/x86_64/e/edk2-ovmf-${pkgver}git${_githash}-${_relnum}.fc26.noarch.rpm"
	"http://download.fedoraproject.org/pub/fedora/linux/updates/testing/26/x86_64/e/edk2-ovmf-ia32-${pkgver}git${_githash}-${_relnum}.fc26.noarch.rpm")
sha256sums=('4d270d7535111efb3183a62e918bbbe8eeea5f74dd3b23265bd2c7dd12dea5c5'
            '82eab89a83ca5267370d3776e233fb867316c6e97292c6628be58a4c36999df8')

package() {
	cd "${srcdir}"
	cp -rv ./usr $pkgdir
}
