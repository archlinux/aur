# Maintainer: Auteiy <dmitry@auteiy.me>

pkgname=posy-cursors
pkgver=3.7
pkgrel=1
pkgdesc="Port of Posy's improved cursors"
arch=(any)
url="https://git.auteiy.me/dmitry/cursorsPosy"
license=(unknown)
source=("$pkgname-$pkgver.tar.gz::https://git.auteiy.me/dmitry/cursorsPosy/-/archive/v3.7/cursorsPosy-v3.7.tar.gz?path=themes")

sha256sums=('38823be4e07fac1e294ae07738fea4b01a89da9c4369047f08832ca4c2bffaac')

package() {
  cd cursorsPosy-v$pkgver-themes/themes
  install -Ddm755 "$pkgdir/usr/share/icons"
  cp -dr --no-preserve=ownership posy-white/ "$pkgdir/usr/share/icons/posy-white"
  cp -dr --no-preserve=ownership posy-black/ "$pkgdir/usr/share/icons/posy-black"
  cp -dr --no-preserve=ownership posy-white-tiny/ "$pkgdir/usr/share/icons/posy-white-tiny"
  cp -dr --no-preserve=ownership posy-black-tiny/ "$pkgdir/usr/share/icons/posy-black-tiny"
}
