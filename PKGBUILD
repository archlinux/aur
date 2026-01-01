# Maintainer: klarkc <local>
pkgname=dwarffortress-ptbr-dfint
pkgver=1.0.0
pkgrel=5
pkgdesc="Headless DFInt PT-BR applier + pacman hook for Dwarf Fortress"
arch=('any')
url='https://github.com/dfint/installer'
license=('MIT')
depends=('python')
optdepends=('dwarffortress: system install at /opt/dwarffortress')
source=('dwarffortress-ptbr-apply' 'dwarffortress-ptbr.hook')
sha256sums=('SKIP' 'SKIP')

package() {
  install -Dm0755 dwarffortress-ptbr-apply "${pkgdir}/usr/bin/dwarffortress-ptbr-apply"
  install -Dm0644 dwarffortress-ptbr.hook "${pkgdir}/usr/share/libalpm/hooks/dwarffortress-ptbr.hook"
}
