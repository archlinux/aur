# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=gdb-dashboard
pkgver=0.1.2
pkgrel=1
pkgdesc='Modular visual interface for GDB in Python'
url='https://github.com/cyrus-and/gdb-dashboard'
arch=('any')
license=('MIT')
depends=('gdb' 'binutils')
optdepends=('python-pygments: syntax highlighting support')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/cyrus-and/gdb-dashboard/archive/v${pkgver}.tar.gz)
sha512sums=('14e26fa1e78e53d87b6a8aa9b74b87b6e932cde919515884d28bb92ff458c19fcd5f68b577a45309b500b49dc919593b29a6984f9795d156726d6aa13a0685c0')

package() {
  cd ${pkgname}-${pkgver}
  install -Dm 644 .gdbinit -t "${pkgdir}/usr/share/${pkgname}"
  install -Dm 644 README.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

# vim: ts=2 sw=2 et:
