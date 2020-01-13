# Maintainer: N.Boughton, <nicholasboughton@gmail.com>
pkgname=myzt
pkgver=0.0.4
pkgrel=1
pkgdesc="Command line GM tools for Mutant: Year Zero"
arch=('x86_64')
url="https://github.com/nboughton/myzt"
license=("MIT")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/nboughton/myzt/releases/download/v${pkgver}/${pkgname}.tar.gz")
sha1sums=('138d42549363f501ff6755bf8a1c33285ecba0ef')

package() {
  cd "$srcdir/build/"
  install -Dm755 "${pkgname}.linux" "${pkgdir}/usr/bin/${pkgname}"
}
