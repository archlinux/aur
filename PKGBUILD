# Maintainer: Auteiy <dmitry@auteiy.me>

pkgname=posy-cursors
pkgver=1.3.5
pkgrel=1
pkgdesc="Port of Posy's improved cursors"
arch=(any)
url="https://git.auteiy.me/dmitry/cursorsPosy"
license=(unknown)
source=("$pkgname-$pkgver.tar.gz::https://git.auteiy.me/dmitry/cursorsPosy/-/archive/v$pkgver/cursorsPosy-v$pkgver.tar.gz")
sha256sums=('c81086c6552747f5e9fbfea1144c441b055dd48f4c96924cd9ad1240a93a5a79')

package() {
  cd cursorsPosy-v$pkgver
  install -Ddm755 "$pkgdir/usr/share/icons"
  cp -dr --no-preserve=ownership posy-default/ "$pkgdir/usr/share/icons/posy-cursors"
}
