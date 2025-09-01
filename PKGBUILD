# Maintainer: Nathan Hagan <nhagan345@gmail.com>
pkgname='snapsr-bin'
pkgver=0.0.1
pkgrel=1
pkgdesc="CLI tool to snapshot and restore custom file setups with ease"
arch=('x86_64')
url="https://github.com/BeastieNate5/snapsr"
license=('MIT')
depends=()
source=("snapsr::https://github.com/BeastieNate5/snapsr/releases/download/v$pkgver/snapsr-x86_64")
sha256sums=('c1c8afb0565a9a8111d0111c61a381122ee79a07cdc3b822591fa913c7282a51')

package() {
    cd "$srcdir"
    install -Dm755 snapsr "$pkgdir/usr/bin/snapsr"
}
