# Maintainer: Your Name <youremail@domain.com>
pkgname=diagslave-bin
_pkgname=diagslave
pkgver=2.12
pkgrel=1
pkgdesc="A simple command line based Modbus slave simulator and test utility."
arch=("x86_64")
url="https://www.modbusdriver.com/diagslave.html"
license=('custom')
provides=("$_pkgname")
source=("https://www.modbusdriver.com/downloads/diagslave.2.12.zip")
md5sums=('7b9584b56d2ab2641ca4affcdb00f19f')

package() {
        cd "$srcdir"
        install -Dm755 linux/diagslave "$pkgdir/usr/bin/diagslave"
        install -Dm644 LICENSE-FREE "$pkgdir/usr/share/licenses/diagslave/LICENSE"
}
