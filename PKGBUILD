# Maintainer: Ben Westover <kwestover.kw@gmail.com>

_snapshot=20220517T205511Z
_pkgrel=1
pkgname=avmf-bin
pkgver=2022.05_rc1
pkgrel=1
pkgdesc='QEMU ARM Virtual Machine UEFI Firmware'
arch=('any')
url='https://www.tianocore.org/edk2/'
license=('BSD')
optdepends=('qemu: Make use of the firmware')
source=("https://snapshot.debian.org/archive/debian/${_snapshot}/pool/main/e/edk2/qemu-efi-arm_${pkgver//_/\~}-${_pkgrel}_all.deb")
sha256sums=('bdbe59818214ac80f84413f0b33f21eb512fe4f800c3eb1c70774bd5cd66404c')

package() {
	bsdtar -xv -C "$pkgdir" -f "$srcdir/data.tar.xz"
	rm -rf "$pkgdir/usr/share/doc"
}
