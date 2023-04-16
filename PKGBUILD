# Maintainer: Minecodes <minecodes at minecodes.de>
pkgname=shortcuts-bin
pkgver=v1.0.0
pkgrel=2
pkgdesc="A tool for getting shortcuts & commands for commands"
arch=('x86_64')
url="https://codeberg.org/Minecodes/shortcuts"
license=('bsd-4-clause')
depends=('gum' 'glow' 'curl')
source=("shortcuts::https://codeberg.org/Minecodes/shortcuts/raw/branch/main/shortcuts")
sha256sums=('SKIP')

package() {
  install -d -m0755 -g 0 "${pkgdir}"/usr/bin
  install -m0755 -g 0 -t "${pkgdir}"/usr/bin/ shortcuts
  ln -s shortcuts ${pkgdir}/usr/bin/shortcuts
}
