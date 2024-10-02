# Maintainer: Rubin Bhandari <roobin.bhandari@gmail.com>

pkgname=pokego-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="command-line tool that lets you display Pokémon sprites in color directly in your terminal"
url="https://github.com/rubiin/pokego"
license=("GPL-3.0")
arch=("any")
provides=("pokego")
conflicts=("pokego" "pokego-git")
source=("https://github.com/rubiin/pokego/releases/download/v$pkgver/pokego-$pkgver.tar.gz")
sha256sums=("f8fd0b77a5b440dabb7032cd95e33bc71daf3bc00972c2571ddad26783eca08b")

package() {
    install -Dm755 pokego -t "$pkgdir/usr/bin"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
