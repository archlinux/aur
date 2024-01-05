# Maintainer: tee < teeaur at duck dot com >
pkgname=polars-cli-bin
pkgver=0.6.0
pkgrel=1
pkgdesc="CLI interface for running SQL queries with Polars as backend"
arch=(x86_64)
url="https://github.com/pola-rs/polars-cli"
license=('MIT')
source=("https://github.com/pola-rs/polars-cli/releases/download/$pkgver/polars-cli-$pkgver-$arch-unknown-linux-gnu.tar.gz")
b2sums=('5ef5e04220ae754a840be78904efe29595d99e4a48239dd187e420712afde185edc93f2e08deb3729cb3e6314c586edc659feed865fa01f4c38d27a8e058a59c')

package() {
    install -Dm0755 polars -t "$pkgdir/usr/bin/"
}
# vim:set noet sts=0 sw=4 ts=4 ft=PKGBUILD:
