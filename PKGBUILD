# Maintainer: Auteiy <dmitry@auteiy.me>

pkgname=posy-cursors
pkgver=3.6
pkgrel=1
pkgdesc="Port of Posy's improved cursors"
arch=(any)
url="https://git.auteiy.me/dmitry/cursorsPosy"
license=(unknown)
makedepends=("imagemagick" "xorg-xcursorgen")
source=("$pkgname-$pkgver.tar.gz::https://git.auteiy.me/dmitry/cursorsPosy/-/archive/v$pkgver/cursorsPosy-v$pkgver.tar.gz?path=Prebuilt")
sha256sums=('0a68ba1adc3a9d2deae6542c07de696d24742500d10ed44500bd5d6e984b2c67')

package() {
  cd cursorsPosy-v$pkgver-Prebuilt/Prebuilt
  install -Ddm755 "$pkgdir/usr/share/icons"
  cp -dr --no-preserve=ownership posy-white/ "$pkgdir/usr/share/icons/posy-white"
  cp -dr --no-preserve=ownership posy-black/ "$pkgdir/usr/share/icons/posy-black"
  cp -dr --no-preserve=ownership posy-white-tiny/ "$pkgdir/usr/share/icons/posy-white-tiny"
  cp -dr --no-preserve=ownership posy-black-tiny/ "$pkgdir/usr/share/icons/posy-black-tiny"
}
