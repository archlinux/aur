# Maintainer: alive4ever
pkgname=edk2-ovmf
pkgver=20180815
_githash=cb5f4f45ce
_relnum=1
_fedoraversion=29
pkgrel=1
pkgdesc="EDK2 ovmf firmware from Fedora $_fedoraversion rpm"
arch=('any')
url="https://fedoraproject.org/wiki/Using_UEFI_with_QEMU"
license=('custom:BSD')
optdepends=("qemu: To make use of edk2 ovmf firmware")
source=("http://download.fedoraproject.org/pub/fedora/linux/releases/$_fedoraversion/Everything/x86_64/os/Packages/e/edk2-ovmf-${pkgver}git${_githash}-${_relnum}.fc$_fedoraversion.noarch.rpm"
	"http://download.fedoraproject.org/pub/fedora/linux/releases/$_fedoraversion/Everything/x86_64/os/Packages/e/edk2-ovmf-ia32-${pkgver}git${_githash}-${_relnum}.fc$_fedoraversion.noarch.rpm")
sha256sums=('dd2e56cd2b09ecf96dd4ae67b15be6b5166cad70b2d6951775d6be67b5aec662'
            '98a8f491843b3a0ccc925069ca9943b06c730ac08a751b47c695f9282cfea273')

package() {
	cd "${srcdir}"
	cp -rv ./usr $pkgdir
}
