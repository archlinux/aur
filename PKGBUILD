# Maintainer: Auteiy <dmitry@auteiy.me>

pkgname=posy-cursors
pkgver=1.2
pkgrel=1
pkgdesc="Port of Posy's improved cursors"
arch=(any)
url="https://git.auteiy.me/dmitry/cursorsPosy"
license=(unknown)
source=("$pkgname-$pkgver.tar.gz::https://git.auteiy.me/dmitry/cursorsPosy/-/archive/v$pkgver/cursorsPosy-v$pkgver.tar.gz")
sha256sums=('003ad698180fd9a2942790ea74689bc6db79fd9471d1aba579ebb129c6f067b1')

package() {
  cd cursorsPosy-v$pkgver
  install -Ddm755 "$pkgdir/usr/share/icons"
  cp -dr --no-preserve=ownership posy-default/ "$pkgdir/usr/share/icons/posy-cursors"
}
