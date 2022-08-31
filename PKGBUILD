# Maintainer: Luna Aphelion <luna-aphelion@proton.me>
pkgname=minfetch
pkgver=1.0.0
pkgrel=2
pkgdesc="a simple customisable fetch script"
arch=('any')
url="https://github.com/xXTacticalWaffleXx/minfetch"
license=('GPL')
provides=("minfetch")
conflicts=("minfetch")
source=("https://raw.githubusercontent.com/xXTacticalWaffleXx/minfetch/main/minfetch")
md5sums=('73f6f5e9aae9f847c94b678482be8b77')

package() {
  install -Dm755 "minfetch" -t "${pkgdir}/usr/bin"
}
