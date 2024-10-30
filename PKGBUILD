# Maintainer: Heiko Jakubzik <heiko.jakubzik@shj-online.de>
#
# This PKGBUILD was generated using `cargo aur`: https://crates.io/crates/cargo-aur, and bash skripting.

pkgname=rremind
pkgver=0.0.5
pkgrel=1
pkgdesc="A simpler alternative to Diane Skoll's remind."
url="https://github.com/Jakubzik/rremind"
license=("GPLv3")
arch=("x86_64")
provides=("rremind")
conflicts=("rremind")
source=("https://github.com/Jakubzik/rremind/releases/download/v$pkgver/rremind-$pkgver-x86_64.tar.gz")
sha256sums=("d4ac4adde3651a0584304230d46c17d54a49b04b033df1615baa9328b370ca9a")

package() {
    install -Dm755 rremind -t "$pkgdir/usr/bin"
    install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
    install -Dm644 rremind.1.gz "$pkgdir/usr/share/man/man1/$pkgname.1.gz"
}
