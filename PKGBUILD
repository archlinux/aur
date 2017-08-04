# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=gdb-dashboard
pkgver=0.2.0
pkgrel=1
pkgdesc='Modular visual interface for GDB in Python'
url='https://github.com/cyrus-and/gdb-dashboard'
arch=('any')
license=('MIT')
depends=('gdb' 'binutils')
optdepends=('python-pygments: syntax highlighting support')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/cyrus-and/gdb-dashboard/archive/v${pkgver}.tar.gz)
sha512sums=('d7054efc9628316071471fc43a097c9638ed9bc8f317c33e61d89ae500785cf3e03a05df000ed8bff4136581ccd432a9c007d3ecb80a858541725f9735c061e8')

package() {
  cd ${pkgname}-${pkgver}
  install -Dm 644 .gdbinit -t "${pkgdir}/usr/share/${pkgname}"
  install -Dm 644 README.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

# vim: ts=2 sw=2 et:
