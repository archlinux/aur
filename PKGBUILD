# Maintainer: Luna Aphelion <luna-aphelion@proton.me>
pkgname=minfetch
pkgver=1.2.1
pkgrel=0
pkgdesc="a simple customisable fetch script"
arch=('any')
url="https://github.com/xXTacticalWaffleXx/minfetch"
license=('GPL')
depends=('bash')
source=("https://github.com/xXTacticalWaffleXx/minfetch/releases/download/$pkgver/minfetch"
        "https://github.com/xXTacticalWaffleXx/minfetch/releases/download/$pkgver/minfetch.1.gz")
md5sums=('7c30aed3d481c4d09c4bf978681ac86c'
        '46b26ba946191ae1a2be24f9e387f577')
package() {
  install -Dm755 "minfetch" -t "${pkgdir}/usr/bin"
  install -D "minfetch.1.gz" -t "${pkgdir}/usr/local/man/man1"
}
