# Maintainer: Auteiy <dmitry@auteiy.me>

pkgname=posy-cursors
pkgver=2
pkgrel=1
pkgdesc="Port of Posy's improved cursors"
arch=(any)
url="https://git.auteiy.me/dmitry/cursorsPosy"
license=(unknown)
source=("$pkgname-$pkgver.tar.gz::https://git.auteiy.me/dmitry/cursorsPosy/-/archive/v$pkgver/cursorsPosy-v$pkgver.tar.gz")
sha256sums=('91df0de432de2883750ec51a6404f24f312a9c785a1e6265c95c3969ef0c0df2')

package() {
  cd cursorsPosy-v$pkgver
  install -Ddm755 "$pkgdir/usr/share/icons"
  cp -dr --no-preserve=ownership posy-white/ "$pkgdir/usr/share/icons/posy-white"
  cp -dr --no-preserve=ownership posy-black/ "$pkgdir/usr/share/icons/posy-black"
}
