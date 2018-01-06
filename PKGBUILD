# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Damir Perisa <damir.perisa@bluewin.ch>

pkgname=lcab
pkgver=1.0b12
pkgrel=5
pkgdesc="A program to make Microsoft cabinet files"
arch=('x86_64')
license=('GPL')
url="http://ohnopub.net/~ohnobinki/lcab/"
depends=('glibc')
source=("ftp://ohnopublishing.net/mirror/${pkgname}-${pkgver}.tar.gz")
md5sums=('9403e08f53fcf262e25641a9b900d4de')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -D -m755 lcab "${pkgdir}/usr/bin/lcab"
}
