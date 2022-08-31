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
md5sums=('260e0aaed29bdeb378cc1a6261f822f1')

package() {
  install -Dm755 "minfetch" -t "${pkgdir}/usr/bin"
}
