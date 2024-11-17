# Maintainer: Heiko Jakubzik <heiko.jakubzik@shj-online.de>
#
# This PKGBUILD was generated using `cargo aur`: https://crates.io/crates/cargo-aur, and bash skripting.

pkgname=rremind
pkgver=0.0.7
pkgrel=1
pkgdesc="A simpler alternative to Diane Skoll's remind."
url="https://github.com/Jakubzik/rremind"
license=("GPLv3")
arch=("x86_64")
provides=("rremind")
conflicts=("rremind")
source=("https://github.com/Jakubzik/rremind/releases/download/v$pkgver/rremind-$pkgver-x86_64.tar.gz")
sha256sums=("da6b6a05275f8692b57c9653300e1cbf8e7ba8f843d9ade5440e69196883872d")

package() {
    install -Dm755 rremind -t "$pkgdir/usr/bin"
    install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
    install -Dm644 rremind.1.gz "$pkgdir/usr/share/man/man1/$pkgname.1.gz"
}
