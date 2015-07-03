# Maintainer: Hardy Jones <jones3 dot hardy at gmail dot com>
pkgname=purescript-bin
pkgver=0.7.0
pkgrel=1
pkgdesc="A strongly, statically typed language compiling to JavaScript."
arch=('x86_64')
url="http://www.purescript.org/"
license=('MIT')
depends=('glibc' 'gmp' 'gcc-libs' 'libtinfo')
provides=('purescript')
source=("https://github.com/joneshf/purescript/releases/download/v$pkgver/linux64.tar.gz")
sha512sums=('7ba26a530067f45749831b86605f6bdeedba08812e3beabb7fc636c26380328aa8102945b5e61ece7ed674e77286ed30209020cf9a08da352171d3c4eff51f95')

package() {
  cd "${srcdir}"/purescript

  install -D -m755 psc "${pkgdir}/usr/bin/psc"
  install -D -m755 psc-docs "${pkgdir}/usr/bin/psc-docs"
  install -D -m755 psc-bundle "${pkgdir}/usr/bin/psc-bundle"
  install -D -m755 psc-publish "${pkgdir}/usr/bin/psc-publish"
  install -D -m755 psci "${pkgdir}/usr/bin/psci"

  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
