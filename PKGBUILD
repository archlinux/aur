# Maintainer: Stanisław Jasiewicz <stjasiewicz@gmail.com>
pkgname=nasher
pkgver=0.11.7
pkgrel=1
pkgdesc="A command-line utility for managing a Neverwinter Nights script or module repository"
arch=('any')
url="https://github.com/squattingmonk/nasher.nim"
license=('MIT')
depends=('nwnsc-bin' 'neverwinter.nim')
makedepends=('nim>=1.2.0' 'nimble')
source=("https://github.com/squattingmonk/nasher.nim/archive/$pkgver.tar.gz")
md5sums=('5cc6d88779b1de5145781b199167cc40')

package() {
	cd nasher.nim-0.11.7
    nimble install --accept --nimbleDir:nimbleDir
    install -Dm 755 "nasher" -t "$pkgdir/usr/bin"
}
