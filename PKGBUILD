# Maintainer: Luna Aphelion <luna-aphelion@proton.me>
pkgname=minfetch
pkgver=1.2
pkgrel=0
pkgdesc="a simple customisable fetch script"
arch=('any')
url="https://github.com/xXTacticalWaffleXx/minfetch"
license=('GPL')
source=('https://raw.githubusercontent.com/xXTacticalWaffleXx/minfetch/main/minfetch'
        'https://github.com/xXTacticalWaffleXx/minfetch/raw/main/minfetch.1.gz')
md5sums=('393a6bd8d89a8d67479d9ba125ea8a13'
        '46b26ba946191ae1a2be24f9e387f577')
package() {
  install -Dm755 "minfetch" -t "${pkgdir}/usr/bin"
  install -D "minfetch.1.gz" -t "${pkgdir}/usr/local/man/man1"
}
