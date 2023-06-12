# Maintainer: Decator <decator.c@proton.me>
pkgname="tara"
pkgver="0.5.0"
pkgrel=1
pkgdesc="Tara is a modern, free, open-source, self-hostable Discord bot"
arch=("x86_64")
url="https://github.com/El-Wumbus/Tara"
license=("Apache")
provides=("tara")
depends=()
source=("https://github.com/El-Wumbus/Tara/releases/download/v$pkgver/tara-v$pkgver-x86_64-unknown-linux-gnu.tar.xz")
sha256sums=('60d967514aa70f92936fdb3db3f5d96897d47e8178f403affbbb7f50a654d7a0')

package() {
    cd "tara-v$pkgver-x86_64-unknown-linux-gnu"
    install -Dm755 ./tara "$pkgdir/usr/bin/tara"
    install -Dm444 ./README.md "$pkgdir/usr/share/doc/Tara/README.md"
    install -Dm444 ./LICENSE "$pkgdir/usr/share/doc/Tara/LICENSE"
}
