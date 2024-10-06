# Maintainer: Rubin Bhandari <roobin.bhandari@gmail.com>

pkgname=pokego-bin
pkgver=0.2.1
pkgrel=1
pkgdesc="command-line tool that lets you display Pokémon sprites in color directly in your terminal"
url="https://github.com/rubiin/pokego"
license=("GPL-3.0")
arch=("any")
provides=("pokego")
conflicts=("pokego" "pokego-git")
source=("https://github.com/rubiin/pokego/releases/download/v$pkgver/pokego-linux-$pkgver.tar.gz")
sha256sums=("d349ee1f417239be356df1dedfd08e664712d391e2534982b0009a37f4388499")

package() {
    install -Dm755 pokego -t "$pkgdir/usr/bin"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
