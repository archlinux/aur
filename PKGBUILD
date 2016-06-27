# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=gdb-dashboard
pkgver=0.0.1
pkgrel=2
pkgdesc='Modular visual interface for GDB in Python'
url='https://github.com/cyrus-and/gdb-dashboard'
arch=('any')
license=('MIT')
depends=('gdb' 'binutils')
optdepends=('python-pygments: syntax highlighting support')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/cyrus-and/gdb-dashboard/archive/v${pkgver}.tar.gz)
sha512sums=('ec792aa666ed39688f5d2b15befacbea550b0fde7f1c0e703f2b077c1896083285b48f5ab5571198a3bd4b1367029696ee16cafb2806afd69973d05c7bda35af')

package() {
  cd ${pkgname}-${pkgver}
  install -Dm 644 .gdbinit -t "${pkgdir}/usr/share/${pkgname}"
  install -Dm 644 README.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

# vim: ts=2 sw=2 et:
