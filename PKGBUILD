# Maintainer: klarkc <local>
pkgname=dwarffortress-ptbr-dfint
pkgver=1.0.0
pkgrel=7
pkgdesc="Headless DFInt PT-BR applier + pacman hook for Dwarf Fortress"
arch=('any')
url='https://github.com/dfint/installer'
license=('MIT')
depends=('python')
optdepends=('dwarffortress: system install at /opt/dwarffortress')
source=('dwarffortress-ptbr-apply' 'dwarffortress-ptbr.hook' 'pt-BR.csv' 'pt-BR.dfint.csv' 'pt-BR.missing.csv')
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')

package() {
  install -Dm0755 dwarffortress-ptbr-apply "${pkgdir}/usr/bin/dwarffortress-ptbr-apply"
  install -Dm0644 dwarffortress-ptbr.hook "${pkgdir}/usr/share/libalpm/hooks/dwarffortress-ptbr.hook"
  install -Dm0644 pt-BR.csv "${pkgdir}/usr/share/dwarffortress-ptbr/overrides/pt-BR.csv"
  install -Dm0644 pt-BR.dfint.csv "${pkgdir}/usr/share/dwarffortress-ptbr/overrides/pt-BR.dfint.csv"
  install -Dm0644 pt-BR.missing.csv "${pkgdir}/usr/share/dwarffortress-ptbr/overrides/pt-BR.missing.csv"
}
