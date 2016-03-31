# Maintainer: Jonas Platte <aur@jonasplatte.de>

pkgname=purescript-bin
pkgver=0.8.3
pkgrel=1
pkgdesc="A small strongly typed programming language with expressive types that compiles to Javascript, written in and inspired by Haskell."
arch=('x86_64')
url="http://www.purescript.org/"
license=('MIT')
depends=('gmp' 'libtinfo-5' 'zlib')
provides=('purescript')
source=("purescript-${pkgver}.tar.gz::https://github.com/purescript/purescript/releases/download/v${pkgver}/linux64.tar.gz")
sha256sums=('6b2520331fc9d329e5dd6abd30641c69bbc0f148931f0850c44b3bdb372ecbdd')

package() {
  cd purescript

  install -D -m755 psc "${pkgdir}/usr/bin/psc"
  install -D -m755 psc-bundle "${pkgdir}/usr/bin/psc-bundle"
  install -D -m755 psc-docs "${pkgdir}/usr/bin/psc-docs"
  install -D -m755 psci "${pkgdir}/usr/bin/psci"
  install -D -m755 psc-ide-client "${pkgdir}/usr/bin/psc-ide-client"
  install -D -m755 psc-ide-server "${pkgdir}/usr/bin/psc-ide-server"
  install -D -m755 psc-publish "${pkgdir}/usr/bin/psc-publish"

  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
