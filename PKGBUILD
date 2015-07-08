# $Id: PKGBUILD 78820 2012-10-25 06:47:28Z foutrelis $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Shinlun Hsieh <yngwiexx@yahoo.com.tw>
# Contributor: Toni Spets <toni.spets@gmail.com>

pkgname=poweriso
pkgver=1.3
pkgrel=4
pkgdesc="A powerful CD/DVD image file processing tool"
arch=('any')
url="http://www.poweriso.com/"
license=('freeware')
source=(http://www.poweriso.com/$pkgname-$pkgver.tar.gz)
md5sums=('f5fc967e284769db387e2feae4a4cddf')

package() {
  install -D -m755 "$srcdir/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
