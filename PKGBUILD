# Maintainer: Geoffrey D. Bennett <g@b4.vu>
pkgname=scarlett2-firmware
epoch=1
pkgver=1.0
pkgrel=1
pkgdesc='Firmware for Focusrite Scarlett 2nd/3rd/4th Gen, Clarett USB/+, and Vocaster'
arch=('any')
url="https://github.com/geoffreybennett/$pkgname"
license=('custom:Focusrite')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('c9c31dd97b5d615ea75d71e57662e927f2f8ab460238143637a462f89f80fa33')

package() {
  cd "$pkgname-$pkgver"
  install -d "$pkgdir/usr/lib/firmware/scarlett2"
  install -m 644 firmware/*.bin "$pkgdir/usr/lib/firmware/scarlett2/"
  install -Dm 644 LICENSE.Focusrite "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
