# Maintainer: Heiko Jakubzik <heiko.jakubzik@shj-online.de>
#
# This PKGBUILD was generated using `cargo aur`: https://crates.io/crates/cargo-aur, and bash skripting.

pkgname=rremind
pkgver=0.0.13
pkgrel=1
pkgdesc="A simpler alternative to Diane Skoll's remind."
url="https://github.com/Jakubzik/rremind"
license=("GPLv3")
arch=("x86_64")
provides=("rremind")
conflicts=("rremind")
source=("https://github.com/Jakubzik/rremind/releases/download/v$pkgver/rremind-$pkgver-x86_64.tar.gz")
sha256sums=("025af6090912bd9f4f2364772b079d1c6b29bcf72c4e51bc3e9cb6ca1afa9959")

package() {
    install -Dm755 rremind -t "$pkgdir/usr/bin"
    install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
    install -Dm644 rremind.1.gz "$pkgdir/usr/share/man/man1/$pkgname.1.gz"
}
