# Maintainer: Ben Westover <kwestover.kw@gmail.com>

_snapshot=20220226T025804Z
_pkgrel=1
pkgname=avmf-bin
pkgver=2022.02
pkgrel=1
pkgdesc='QEMU ARM Virtual Machine UEFI Firmware'
arch=('any')
url='https://www.tianocore.org/edk2/'
license=('BSD')
optdepends=('qemu: Make use of the firmware')
source=("https://snapshot.debian.org/archive/debian/${_snapshot}/pool/main/e/edk2/qemu-efi-arm_${pkgver}-${_pkgrel}_all.deb")
sha256sums=('077f42ebe5ad620087b78cf333ab32c05a4bc09746ea18e5abfc739d693c3810')

package() {
	bsdtar -xv -C "$pkgdir" -f "$srcdir/data.tar.xz"
	rm -rf "$pkgdir/usr/share/doc"
}
