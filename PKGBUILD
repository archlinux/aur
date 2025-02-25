# Maintainer: Heiko Jakubzik <heiko.jakubzik@shj-online.de>
#
# This PKGBUILD was generated using `cargo aur`: https://crates.io/crates/cargo-aur, and bash skripting.

pkgname=rremind
pkgver=0.0.11
pkgrel=1
pkgdesc="A simpler alternative to Diane Skoll's remind."
url="https://github.com/Jakubzik/rremind"
license=("GPLv3")
arch=("x86_64")
provides=("rremind")
conflicts=("rremind")
source=("https://github.com/Jakubzik/rremind/releases/download/v$pkgver/rremind-$pkgver-x86_64.tar.gz")
sha256sums=("339765be5b5019fe4df1b125710dcb36fe7db4acff4a5c13331beaf81cf1d6ba")

package() {
    install -Dm755 rremind -t "$pkgdir/usr/bin"
    install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
    install -Dm644 rremind.1.gz "$pkgdir/usr/share/man/man1/$pkgname.1.gz"
}
