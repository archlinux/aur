# Maintainer: Ben Westover <kwestover.kw@gmail.com>

pkgname=avmf-bin
pkgver=2021.11
pkgrel=1
pkgdesc='QEMU ARM Virtual Machine UEFI Firmware'
arch=('any')
url='https://www.tianocore.org/edk2/'
license=('BSD')
optdepends=('qemu: Make use of the firmware')
source=("https://deb.debian.org/debian/pool/main/e/edk2/qemu-efi-arm_${pkgver}-${pkgrel}_all.deb")
sha256sums=('a091b46bf84259f7f1fbd3b4e509d6596254ee52db6ea9853127417222898733')

package() {
	bsdtar -xv -C "$pkgdir" -f "$srcdir/data.tar.xz"
	rm -rf "$pkgdir/usr/share/doc"
}
