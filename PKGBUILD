# $Id: PKGBUILD 257022 2017-09-11 20:08:52Z jelle $
# Maintainer: Timothy Redaelli <timothy.redaelli@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=sub2srt
pkgver=0.5.5
pkgrel=2
pkgdesc="A simple tool to convert 2 common subtitle formats to .srt format"
arch=('any')
url="http://www.robelix.com/sub2srt/"
license=('GPL')
depends=('perl')
source=($pkgname-$pkgver.tar.gz::https://github.com/robelix/sub2srt/archive/$pkgver.tar.gz)
md5sums=('e68b22eca94ae7b9207a4f9c46c17ad5')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -D -m755 $pkgname "$pkgdir/usr/bin/$pkgname"
}
