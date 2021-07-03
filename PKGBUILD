# $Id: PKGBUILD 78820 2012-10-25 06:47:28Z foutrelis $
# Maintainer: JinguTech <xiuluo dot android at gmail dot com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Shinlun Hsieh <yngwiexx@yahoo.com.tw>
# Contributor: Toni Spets <toni.spets@gmail.com>

pkgname=poweriso
pkgver=1.5
pkgrel=1
pkgdesc="A powerful CD/DVD image file processing tool"
arch=('any')
url="http://www.poweriso.com/"
license=('freeware')
source=(http://www.poweriso.com/$pkgname-$pkgver.tar.gz)
sha256sums=('1893189e0c8b77da179df64a64cf8e62c4216684d1ab262867c6c96faae64ee2')

package() {
  install -D -m755 "$srcdir/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
