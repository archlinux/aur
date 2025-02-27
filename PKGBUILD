# Maintainer: Heiko Jakubzik <heiko.jakubzik@shj-online.de>
#
# This PKGBUILD was generated using `cargo aur`: https://crates.io/crates/cargo-aur, and bash skripting.

pkgname=pgburst
pkgver=0.2.5
pkgrel=1
pkgdesc="A file-based way to edit postgresql databases (procedures, views, triggers) without GUI"
url="https://github.com/Jakubzik/pgburst"
license=("GPLv3")
arch=("x86_64")
provides=("pgburst")
conflicts=("pgburst")
source=("https://github.com/Jakubzik/pgburst/releases/download/v$pkgver/pgburst-$pkgver-x86_64.tar.gz")
sha256sums=("7cf12de32d10b4902e66a2166234af413948f8da78ff883eaddce54a06415583")

package() {
    install -Dm755 pgburst -t "$pkgdir/usr/bin"
    install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
    install -Dm644 pgburst.1.gz "$pkgdir/usr/share/man/man1/$pkgname.1.gz"
}
