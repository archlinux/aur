# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Andre "Osku" Schmidt <andre.osku.schmidt@gmail.com>

pkgname=ovmf-bin
pkgver=15214
pkgrel=2
pkgdesc="Prebuild UEFI firmware for qemu etc."
arch=('x86_64')
url="http://tianocore.github.io/ovmf/"
license=('BSD')
source=("http://downloads.sourceforge.net/edk2/OVMF/OVMF-X64-r$pkgver.zip")
md5sums=('e83e00f9348f6b004bab7f4489653147')

package() {
  cd "$srcdir"
  install -Dm644 OVMF.fd "$pkgdir"/usr/share/ovmf/bios.bin
}

# vim:set ts=2 sw=2 et:

