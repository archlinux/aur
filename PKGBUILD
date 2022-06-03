# Maintainer: Ben Westover <kwestover.kw@gmail.com>

_snapshot=20220603T163609Z
_pkgrel=1
pkgname=avmf-bin
pkgver=2022.05
pkgrel=1
pkgdesc='QEMU ARM Virtual Machine UEFI Firmware'
arch=('any')
url='https://www.tianocore.org/edk2/'
license=('BSD')
optdepends=('qemu: Make use of the firmware')
source=("https://snapshot.debian.org/archive/debian/${_snapshot}/pool/main/e/edk2/qemu-efi-arm_${pkgver//_/\~}-${_pkgrel}_all.deb")
sha256sums=('55a5dcd3144e868413bf172f7f5a04dce0f7f9a1d4e524dda52e50061bf77464')

package() {
	bsdtar -xv -C "$pkgdir" -f "$srcdir/data.tar.xz"
	rm -rf "$pkgdir/usr/share/doc"
}
