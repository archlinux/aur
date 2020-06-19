# Maintainer: Synhme <dmitry@synh.me>

pkgname=posy-cursors
pkgver=3.7
pkgrel=3
pkgdesc="Port of Posy's improved cursors"
arch=(any)
url="https://git.synh.me/dmitry/posy-cursors"
license=(unknown)
source=("$pkgname-$pkgver.tar.gz::https://git.synh.me/dmitry/posy-cursors/-/archive/v3.7/posy-cursors-v3.7.tar.gz?path=themes")

sha256sums=('3c4b7e4293143057e7a5a90b63bebee9c785ca4552e5dddbf538b8322036d471')

package() {
  cd posy-cursors-v$pkgver-themes/themes
  install -Ddm755 "$pkgdir/usr/share/icons"
  cp -dr --no-preserve=ownership posy-white/ "$pkgdir/usr/share/icons/posy-white"
  cp -dr --no-preserve=ownership posy-black/ "$pkgdir/usr/share/icons/posy-black"
  cp -dr --no-preserve=ownership posy-white-tiny/ "$pkgdir/usr/share/icons/posy-white-tiny"
  cp -dr --no-preserve=ownership posy-black-tiny/ "$pkgdir/usr/share/icons/posy-black-tiny"
}
