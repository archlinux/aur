# Maintainer: Geoffrey D. Bennett <g@b4.vu>
pkgname=scarlett2-firmware
epoch=1
pkgver=1.1
pkgrel=1
pkgdesc='Firmware for Focusrite Scarlett 2nd/3rd/4th Gen, Clarett USB/+, and Vocaster'
arch=('any')
url="https://github.com/geoffreybennett/$pkgname"
license=('custom:Focusrite')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('be86197db08d768568853d82529d1b8929aea60d8b3690a2a41972800c1ad555')

package() {
  cd "$pkgname-$pkgver"
  install -d "$pkgdir/usr/lib/firmware/scarlett2"
  install -m 644 firmware/*.bin "$pkgdir/usr/lib/firmware/scarlett2/"
  install -Dm 644 LICENSE.Focusrite "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
