# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=gdb-dashboard
pkgver=0.0.2
pkgrel=1
pkgdesc='Modular visual interface for GDB in Python'
url='https://github.com/cyrus-and/gdb-dashboard'
arch=('any')
license=('MIT')
depends=('gdb' 'binutils')
optdepends=('python-pygments: syntax highlighting support')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/cyrus-and/gdb-dashboard/archive/v${pkgver}.tar.gz)
sha512sums=('0476779b5711b1ec9d90955b9397d167c24f1c0acbbe1236ac59634f131efb7dc2a5a160fd984b5cb535b7c3e5cd9e62b377063eb52f2c71ba506b2d64fdbd80')

package() {
  cd ${pkgname}-${pkgver}
  install -Dm 644 .gdbinit -t "${pkgdir}/usr/share/${pkgname}"
  install -Dm 644 README.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

# vim: ts=2 sw=2 et:
