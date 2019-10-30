# Maintainer: Auteiy <dmitry@auteiy.me>

pkgname=posy-cursors
pkgver=3.6.1
pkgrel=1
pkgdesc="Port of Posy's improved cursors"
arch=(any)
url="https://git.auteiy.me/dmitry/cursorsPosy"
license=(unknown)
makedepends=("imagemagick" "xorg-xcursorgen")
source=("$pkgname-$pkgver.tar.gz::https://git.auteiy.me/dmitry/cursorsPosy/-/archive/v$pkgver/cursorsPosy-v$pkgver.tar.gz?path=Prebuilt")
sha256sums=('f229b49c004b1162c4f934b137409e580f1819912182e683d43a278703bfc9bb')

package() {
  cd cursorsPosy-v$pkgver-Prebuilt/Prebuilt
  install -Ddm755 "$pkgdir/usr/share/icons"
  cp -dr --no-preserve=ownership posy-white/ "$pkgdir/usr/share/icons/posy-white"
  cp -dr --no-preserve=ownership posy-black/ "$pkgdir/usr/share/icons/posy-black"
  cp -dr --no-preserve=ownership posy-white-tiny/ "$pkgdir/usr/share/icons/posy-white-tiny"
  cp -dr --no-preserve=ownership posy-black-tiny/ "$pkgdir/usr/share/icons/posy-black-tiny"
}
