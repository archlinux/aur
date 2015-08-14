# Maintainer: Hardy Jones <jones3 dot hardy at gmail dot com>
pkgname=purescript-bin
pkgver=0.7.3
pkgrel=1
pkgdesc="A strongly, statically typed language compiling to JavaScript."
arch=('x86_64')
url="http://www.purescript.org/"
license=('MIT')
depends=('glibc' 'gmp' 'gcc-libs' 'libtinfo')
provides=('purescript')
source=("https://github.com/joneshf/purescript/releases/download/v$pkgver/linux64.tar.gz")
sha512sums=('da934de4c326b3a2b578cab08f35fcdc5b62a02840950264e14d50c2a4c30561ecf2bc710f4e92e430f2fd93ea7f45ece821391d64e2e3059bc8e17ed6ab66fd')

package() {
  cd "${srcdir}"/purescript

  install -D -m755 psc "${pkgdir}/usr/bin/psc"
  install -D -m755 psc-docs "${pkgdir}/usr/bin/psc-docs"
  install -D -m755 psc-bundle "${pkgdir}/usr/bin/psc-bundle"
  install -D -m755 psc-publish "${pkgdir}/usr/bin/psc-publish"
  install -D -m755 psci "${pkgdir}/usr/bin/psci"

  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
