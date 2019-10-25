# Maintainer: Auteiy <dmitry@auteiy.me>

pkgname=posy-cursors
pkgver=1.0
pkgrel=3
pkgdesc="Port of Posy's improved cursors for Windows 10"
arch=(any)
url="https://git.auteiy.me/dmitry/cursorsPosy"
license=(unknown)
source=("$pkgname-$pkgver.tar.gz::https://git.auteiy.me/dmitry/cursorsPosy/-/archive/v$pkgver/cursorsPosy-v$pkgver.tar.gz")
sha256sums=('9abadc31d0c869b4f315c63bd0bc24e43695d8d69646a8d1271d1990344fbcb2')

package() {
  cd cursorsPosy-v$pkgver
  install -Ddm755 "$pkgdir/usr/share/icons"
  cp -dr --no-preserve=ownership dist/ "$pkgdir/usr/share/icons/posy-cursors"
}
