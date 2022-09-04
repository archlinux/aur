# Maintainer: Ben Westover <kwestover.kw@gmail.com>

_snapshot=20220607T150728Z
_pkgrel=2
pkgname=avmf-bin
pkgver=2022.05
pkgrel=3
pkgdesc='QEMU ARM Virtual Machine UEFI Firmware'
arch=('any')
url='https://www.tianocore.org/edk2/'
license=('BSD')
optdepends=('qemu: Make use of the firmware')
source=("https://snapshot.debian.org/archive/debian/${_snapshot}/pool/main/e/edk2/qemu-efi-arm_${pkgver//_/\~}-${_pkgrel}_all.deb")
sha256sums=('1e5456d28c7e8986148d8e4781e76a1ed841a0267f450570a3975845e0b10900')

package() {
	bsdtar -xv -C "$pkgdir" -f "$srcdir/data.tar.xz"
	rm -rf "$pkgdir/usr/share/doc"
}
