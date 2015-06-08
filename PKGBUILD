# Maintainer: Hardy Jones <jones3 dot hardy at gmail dot com>
pkgname=purescript-bin
pkgver=0.6.9.5
pkgrel=1
pkgdesc="A strongly, statically typed language compiling to JavaScript."
arch=('x86_64')
url="http://www.purescript.org/"
license=('MIT')
depends=('glibc' 'gmp' 'gcc-libs' 'libtinfo')
provides=('purescript')
source=("https://github.com/joneshf/purescript/releases/download/v$pkgver/linux64.tar.gz")
sha512sums=('2f9e267cd171816a17affcf90c68c5bdec72ee4f12e9de521fb3ec30b1c3e92c6603e775282f2e29b31f31f4c3c3a32b8ae2f98e0fd504e1cea3b94cab56a9c7')

package() {
  cd "${srcdir}"/purescript

  install -D -m755 psc "${pkgdir}/usr/bin/psc"
  install -D -m755 psc-docs "${pkgdir}/usr/bin/psc-docs"
  install -D -m755 psc-make "${pkgdir}/usr/bin/psc-make"
  install -D -m755 psci "${pkgdir}/usr/bin/psci"

  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
