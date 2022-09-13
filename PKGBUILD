# Maintainer: Ben Westover <kwestover.kw@gmail.com>

_snapshot=20220912T032508Z
_pkgrel=1
pkgname=avmf-bin
pkgver=2022.08
pkgrel=1
pkgdesc='QEMU ARM Virtual Machine UEFI Firmware'
arch=('any')
url='https://www.tianocore.org/edk2/'
license=('BSD')
optdepends=('qemu: Make use of the firmware')
source=("https://snapshot.debian.org/archive/debian/${_snapshot}/pool/main/e/edk2/qemu-efi-arm_${pkgver//_/\~}-${_pkgrel}_all.deb")
sha256sums=('99906deb315c3d967084fbe988184f5efebe11962601f6654fa2f852e8015e87')

package() {
	bsdtar -xv -C "$pkgdir" -f "$srcdir/data.tar.xz"
	rm -rf "$pkgdir/usr/share/doc"
}
