# Maintainer: Hardy Jones <jones3 dot hardy at gmail dot com>
pkgname=purescript-bin
pkgver=0.6.7.1
pkgrel=1
pkgdesc="A strongly, statically typed language compiling to JavaScript."
arch=('x86_64')
url="http://www.purescript.org/"
license=('MIT')
depends=('glibc' 'gmp' 'gcc-libs' 'libtinfo')
provides=('purescript')
source=("https://github.com/purescript/purescript/releases/download/v$pkgver/linux64.tar.gz")
sha512sums=('fb5f384735b99096fc0b0e427346aacc6ae90e7f2e3ffec3594f7a04b5f55c2cc10b42fd882cd010ac8140e3704a92b3fa4ef0448ff508be30eca8584500dad4')

package() {
  cd "${srcdir}"/purescript

  install -D -m755 psc "${pkgdir}/usr/bin/psc"
  install -D -m755 psc-docs "${pkgdir}/usr/bin/psc-docs"
  install -D -m755 psc-make "${pkgdir}/usr/bin/psc-make"
  install -D -m755 psci "${pkgdir}/usr/bin/psci"

  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
