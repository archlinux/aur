# Maintainer: Ben Westover <kwestover.kw@gmail.com>

_snapshot=20220908T212505Z
_pkgrel=4
pkgname=avmf-bin
pkgver=2022.05
pkgrel=4
pkgdesc='QEMU ARM Virtual Machine UEFI Firmware'
arch=('any')
url='https://www.tianocore.org/edk2/'
license=('BSD')
optdepends=('qemu: Make use of the firmware')
source=("https://snapshot.debian.org/archive/debian/${_snapshot}/pool/main/e/edk2/qemu-efi-arm_${pkgver//_/\~}-${_pkgrel}_all.deb")
sha256sums=('7f6d6b29f51524b764ebe2e77934b2626af5f353200c06837412f96c07e74407')

package() {
	bsdtar -xv -C "$pkgdir" -f "$srcdir/data.tar.xz"
	rm -rf "$pkgdir/usr/share/doc"
}
