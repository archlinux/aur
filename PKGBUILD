# Maintainer: Hardy Jones <jones3 dot hardy at gmail dot com>
pkgname=purescript-bin
pkgver=0.7.2.1
pkgrel=1
pkgdesc="A strongly, statically typed language compiling to JavaScript."
arch=('x86_64')
url="http://www.purescript.org/"
license=('MIT')
depends=('glibc' 'gmp' 'gcc-libs' 'libtinfo')
provides=('purescript')
source=("https://github.com/joneshf/purescript/releases/download/v$pkgver/linux64.tar.gz")
sha512sums=('d5587983cebe3840d66dbf4d1be836bfe4dbc81bc21cccc21a4f641d2fdc36fb5e84da0adc5846257cf34f3b30fe192b85ce1a8d43544cfa6ede9092df22ac49')

package() {
  cd "${srcdir}"/purescript

  install -D -m755 psc "${pkgdir}/usr/bin/psc"
  install -D -m755 psc-docs "${pkgdir}/usr/bin/psc-docs"
  install -D -m755 psc-bundle "${pkgdir}/usr/bin/psc-bundle"
  install -D -m755 psc-publish "${pkgdir}/usr/bin/psc-publish"
  install -D -m755 psci "${pkgdir}/usr/bin/psci"

  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
