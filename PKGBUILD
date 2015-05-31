# Maintainer: fordprefect <fordprefect@dukun.de>
pkgname=fpiet
pkgver=0.1
pkgrel=2
pkgdesc="very fast Piet interpreter using its own gif implementation"
url="http://www.matthias-ernst.eu/fpiet.html"
arch=('x86_64' 'i686')
license=('public domain')
depends=('zlib' 'gcc-libs')
makedepends=()
source=("http://www.matthias-ernst.eu/pietc/fpiet0.1.tar.gz")
md5sums=('9c9dbb329de907621a36eeb3f60c0102')
 
build() {
    cd "${srcdir}"
    make all
 }
  
package() {
    install -Dm755 ${srcdir}/bin/fpiet ${pkgdir}/usr/bin/fpiet
  }
