# Maintainer: Ben Westover <kwestover.kw@gmail.com>

_snapshot=20221126T030115Z
_pkgrel=1
pkgname=avmf-bin
pkgver=2022.11
pkgrel=1
pkgdesc='QEMU ARM Virtual Machine UEFI Firmware'
arch=('any')
url='https://www.tianocore.org/edk2/'
license=('BSD')
optdepends=('qemu: Make use of the firmware')
source=("https://snapshot.debian.org/archive/debian/${_snapshot}/pool/main/e/edk2/qemu-efi-arm_${pkgver//_/\~}-${_pkgrel}_all.deb")
sha256sums=('fe98edbd89a3cbf3549d94c0e2dabda02508cfd7e74e6419d494612ab6765c93')

package() {
	bsdtar -xv -C "$pkgdir" -f "$srcdir/data.tar.xz"
	rm -rf "$pkgdir/usr/share/doc"
}
