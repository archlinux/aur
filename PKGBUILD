# Maintainer: Hardy Jones <jones3 dot hardy at gmail dot com>
pkgname=purescript-bin
pkgver=0.6.1
pkgrel=1
pkgdesc="A strongly, statically typed language compiling to JavaScript."
arch=('x86_64')
url="http://www.purescript.org/"
license=('MIT')
depends=('glibc' 'gmp' 'gcc-libs' 'libtinfo')
provides=('purescript')
source=("https://github.com/purescript/purescript/releases/download/v$pkgver/linux64.tar.gz")
sha512sums=('541fac1b4cb05e513d07bd34663996d0ddbd203f8eac1c22585b741c4b1e5e4f34d6d3b82d7601122747106f6bafbfa73c2c06aafebe64184707e6f19d3e78ec')

package() {
  cd "${srcdir}"/purescript

  install -D -m755 psc "${pkgdir}/usr/bin/psc"
  install -D -m755 psc-docs "${pkgdir}/usr/bin/psc-docs"
  install -D -m755 psc-make "${pkgdir}/usr/bin/psc-make"
  install -D -m755 psci "${pkgdir}/usr/bin/psci"

  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
