# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=byacc-bison
pkgver=1
pkgrel=1
pkgdesc="A Berkeley reimplementation of the Unix parser generator Yacc (providing bison/yacc)"
url="http://invisible-island.net/byacc/"
arch=('any')
license=('custom')
depends=('byacc')
provides=('bison')
conflicts=('bison')
source=()

package() {
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -sf /usr/share/licenses/byacc/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -d "${pkgdir}/usr/bin"
  ln -sf /usr/bin/byacc "${pkgdir}/usr/bin/yacc"
  ln -sf /usr/bin/byacc "${pkgdir}/usr/bin/bison"

  install -d "${pkgdir}/usr/share/man/man1"
  ln -sf /usr/share/man/man1/byacc.1.gz "${pkgdir}/usr/share/man/man1/yacc.1.gz"
  ln -sf /usr/share/man/man1/byacc.1.gz "${pkgdir}/usr/share/man/man1/bison.1.gz"
}

# vim:set ts=2 sw=2 et:
