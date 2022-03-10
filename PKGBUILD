# Maintainer: Ben Westover <kwestover.kw@gmail.com>

_snapshot=20220310T035035Z
_pkgrel=2
pkgname=avmf-bin
pkgver=2022.02
pkgrel=2
pkgdesc='QEMU ARM Virtual Machine UEFI Firmware'
arch=('any')
url='https://www.tianocore.org/edk2/'
license=('BSD')
optdepends=('qemu: Make use of the firmware')
source=("https://snapshot.debian.org/archive/debian/${_snapshot}/pool/main/e/edk2/qemu-efi-arm_${pkgver}-${_pkgrel}_all.deb")
sha256sums=('6f30d14121b4dc327d3d47dfc49030bad495a3154b682761ee06af968a68decf')

package() {
	bsdtar -xv -C "$pkgdir" -f "$srcdir/data.tar.xz"
	rm -rf "$pkgdir/usr/share/doc"
}
