# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=gdb-dashboard
pkgver=0.1.3
pkgrel=1
pkgdesc='Modular visual interface for GDB in Python'
url='https://github.com/cyrus-and/gdb-dashboard'
arch=('any')
license=('MIT')
depends=('gdb' 'binutils')
optdepends=('python-pygments: syntax highlighting support')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/cyrus-and/gdb-dashboard/archive/v${pkgver}.tar.gz)
sha512sums=('1a99c2ff7af63987015456a47c0e870ba7d1e3950e33ddb4571de071e1d4c6f1b5d944469c3507b223396bd325a9e053d7c63e7056617d84c2e5c4307d64ab8c')

package() {
  cd ${pkgname}-${pkgver}
  install -Dm 644 .gdbinit -t "${pkgdir}/usr/share/${pkgname}"
  install -Dm 644 README.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

# vim: ts=2 sw=2 et:
