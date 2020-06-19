# Maintainer: Synhme <dmitry@synh.me>

pkgname=posy-cursors
pkgver=3.7
pkgrel=2
pkgdesc="Port of Posy's improved cursors"
arch=(any)
url="https://git.synh.me/dmitry/posy-cursors"
license=(unknown)
source=("$pkgname-$pkgver.tar.gz::https://git.synh.me/dmitry/posy-cursors/-/archive/master/posy-cursors-master.tar.gz?path=themes")

sha256sums=('72fd1ebb2c55864e6c598e96f5dffac6ac68cf8f4b7bb164d62a3ac369acb419')

package() {
  cd cursorsPosy-v$pkgver-themes/themes
  install -Ddm755 "$pkgdir/usr/share/icons"
  cp -dr --no-preserve=ownership posy-white/ "$pkgdir/usr/share/icons/posy-white"
  cp -dr --no-preserve=ownership posy-black/ "$pkgdir/usr/share/icons/posy-black"
  cp -dr --no-preserve=ownership posy-white-tiny/ "$pkgdir/usr/share/icons/posy-white-tiny"
  cp -dr --no-preserve=ownership posy-black-tiny/ "$pkgdir/usr/share/icons/posy-black-tiny"
}
