# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
pkgname=resp
pkgver=2.2
pkgrel=4
pkgdesc="Standalone RESP charge fitting program"
arch=('i686' 'x86_64')
url="http://upjv.q4md-forcefieldtools.org"
license=('AMBER')
depends=('gcc-libs')
makedepends=('gcc-fortran')
source=("${pkgname}-${pkgver}.tar.gz")
md5sums=('bbb8a988d7bfecaf18501538528fd05d')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -Dm755 ${srcdir}/${pkgname}-${pkgver}/resp ${pkgdir}/usr/bin/resp
}
