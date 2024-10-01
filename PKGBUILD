# Maintainer: Rubin Bhandari <roobin.bhandari@gmail.com>

pkgname=pokego-bin
pkgver=0.1.1
pkgrel=1
pkgdesc="command-line tool that lets you display Pokémon sprites in color directly in your terminal"
url="https://github.com/rubiin/pokego"
license=("GPL-3.0")
arch=("any")
provides=("pokego")
conflicts=("pokego" "pokego-git")
source=("https://github.com/rubiin/pokego/releases/download/v$pkgver/pokego-$pkgver.tar.gz")
sha256sums=("725d1ab6de65faa02dae3262cf1c66ccfc8fb9a3dade0029e5832b2f072dfb60")

package() {
    install -Dm755 krabby -t "$pkgdir/usr/bin"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
