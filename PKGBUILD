# $Id: PKGBUILD 78820 2012-10-25 06:47:28Z foutrelis $
# Maintainer: JinguTech <xiuluo dot android at gmail dot com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Shinlun Hsieh <yngwiexx@yahoo.com.tw>
# Contributor: Toni Spets <toni.spets@gmail.com>

pkgname=poweriso
pkgver=1.6
pkgrel=1
pkgdesc="A powerful CD/DVD image file processing tool"
arch=('any')
url="http://www.poweriso.com/"
license=('freeware')
source=(http://www.poweriso.com/$pkgname-$pkgver.tar.gz)
sha256sums=('6364e4b5cb5fe75dd32f27703daf694f31d72344993b6a44e33c94c8f14c625b')

package() {
  install -D -m755 "$srcdir/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
