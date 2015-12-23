# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname="bcwc-pcie-firmware"
pkgver=1.43.0
pkgrel=1
pkgdesc="Reverse engineered Linux driver for the Broadcom 1570 PCIe webcam."
arch=('x86_64')
url="https://github.com/patjak/bcwc_pcie"
license=('unknown')

# firmware.bin needs to be extracted from OS X manually.
source=("firmware.bin::https://github.com/patjak/bcwc_pcie/wiki/Get-Started")
md5sums=('4e1d11e205e5c55d128efa0029b268fe')

package() {
  install -Dm 644 "$srcdir"/firmware.bin \
    "$pkgdir/usr/lib/firmware/facetimehd/firmware.bin"
}
