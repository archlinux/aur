# Maintainer: Elrondo46 TuxnVape <elrond94@hotmail.com>

pkgname=amar-installer
pkgver=2.0
pkgrel=1
pkgdesc="Will remove AMAR this is the end of AMAR"
arch=('x86_64')
license=('GPL3')
url="https://www.tuxnvape.fr/"
depends=("python" "python-gobject")
install=amar.install
source=("gbamar.txt")

sha256sums=('SKIP')

package() {
        install -Dm644 "gbamar.txt" "${pkgdir}/opt/gbamar.txt"
} 

