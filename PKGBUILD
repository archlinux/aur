# Maintainer: Geoffrey D. Bennett <g@b4.vu>
pkgname=scarlett4-firmware
epoch=1
pkgver=1.1
pkgrel=1
pkgdesc='Firmware for Focusrite Scarlett 4th Gen 16i16, 18i16, 18i20 and ISA C8X'
arch=('any')
url="https://github.com/geoffreybennett/$pkgname"
license=('custom:Focusrite')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('24cde606b03350fd11b96079cc3a1b0db2cef315a3218affbd9e3f3a048a8077')

package() {
  cd "$pkgname-$pkgver"
  install -d "$pkgdir/usr/lib/firmware/scarlett4"
  install -m 644 firmware/*.bin "$pkgdir/usr/lib/firmware/scarlett4/"
  install -Dm 644 LICENSE.Focusrite "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
