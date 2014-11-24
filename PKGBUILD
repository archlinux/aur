# Maintainer: Hardy Jones <jones3 dot hardy at gmail dot com>
pkgname=purescript-bin
pkgver=0.6.1.2
pkgrel=1
pkgdesc="A strongly, statically typed language compiling to JavaScript."
arch=('x86_64')
url="http://www.purescript.org/"
license=('MIT')
depends=('glibc' 'gmp' 'gcc-libs' 'libtinfo')
provides=('purescript')
source=("https://github.com/purescript/purescript/releases/download/v$pkgver/linux64.tar.gz")
sha512sums=('2e3d0af5998f5c2c525448fcf19f892123fedecf9fc21330f6f1e34bb51d5348e7c98778e4e200a5ad2e34ef224e14e2b854c128740e225cb8f8c881bbbb6503')

package() {
  cd "${srcdir}"/purescript

  install -D -m755 psc "${pkgdir}/usr/bin/psc"
  install -D -m755 psc-docs "${pkgdir}/usr/bin/psc-docs"
  install -D -m755 psc-make "${pkgdir}/usr/bin/psc-make"
  install -D -m755 psci "${pkgdir}/usr/bin/psci"

  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
