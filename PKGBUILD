# Maintainer: Auteiy <dmitry@auteiy.me>

pkgname=posy-cursors
pkgver=3.6.11
pkgrel=1
pkgdesc="Port of Posy's improved cursors"
arch=(any)
url="https://git.auteiy.me/dmitry/cursorsPosy"
license=(unknown)
source=("$pkgname-$pkgver.tar.gz::https://git.auteiy.me/dmitry/cursorsPosy/-/archive/v3.6.11/cursorsPosy-v3.6.11.tar.gz?path=themes")

sha256sums=('645d55d9e3653d8bb3919e6cea8b06a33a1350de6ebfaee404265279ee8cdd7c')

package() {
  cd cursorsPosy-v$pkgver-themes/themes
  install -Ddm755 "$pkgdir/usr/share/icons"
  cp -dr --no-preserve=ownership posy-white/ "$pkgdir/usr/share/icons/posy-white"
  cp -dr --no-preserve=ownership posy-black/ "$pkgdir/usr/share/icons/posy-black"
  cp -dr --no-preserve=ownership posy-white-tiny/ "$pkgdir/usr/share/icons/posy-white-tiny"
  cp -dr --no-preserve=ownership posy-black-tiny/ "$pkgdir/usr/share/icons/posy-black-tiny"
}
