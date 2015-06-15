# Maintainer: fordprefect <fordprefect@dukun.de>
pkgname=pietcompiler
pkgver=0.6a3
pkgrel=1
pkgdesc="compiler for Piet esotheric langguare, that processes images - unstable"
url="http://www.matthias-ernst.eu/pietcompiler.html"
arch=('x86_64' 'i686')
license=('public domain')
depends=('zlib' 'gcc-libs')
install='piet.install'
source=("http://www.matthias-ernst.eu/pietc/PietCompiler0.6a3.tar.gz"
        'piet.install')
md5sums=('faadc1b70cd497b95b5bef41bb1977e9'
          '686f9c0926e41b49cf0434b0291e4c6d')
 
build() {
    cd "${srcdir}/PietCompiler"
    make all
 }
  
package() {
    install -Dm755 ${srcdir}/PietCompiler/PietCompiler ${pkgdir}/usr/bin/pietcompiler
  }
