# Maintainer: N.Boughton, <nicholasboughton@gmail.com>
pkgname=myzt
pkgver=0.0.3
pkgrel=1
pkgdesc="Command line GM tools for Mutant: Year Zero"
arch=('x86_64')
url="https://github.com/nboughton/myzt"
license=("MIT")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/nboughton/myzt/releases/download/v${pkgver}/${pkgname}.tar.gz")
sha1sums=('0c7e0fe481c225a84dff9081dbd7d14d564da1ad')

package() {
  cd "$srcdir/build/"
  install -Dm755 "${pkgname}.linux" "${pkgdir}/usr/bin/${pkgname}"
}
