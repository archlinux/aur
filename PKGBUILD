# Maintainer: tee < teeaur at duck dot com >
pkgname=polars-cli-bin
pkgver=0.8.0
pkgrel=1
pkgdesc="CLI interface for running SQL queries with Polars as backend"
arch=(x86_64)
url="https://github.com/pola-rs/polars-cli"
license=('MIT')
source=("https://github.com/pola-rs/polars-cli/releases/download/$pkgver/polars-cli-$pkgver-$arch-unknown-linux-gnu.tar.gz")
b2sums=('438f89a6aa4d797286e32f37395263c04555dad37b44ce5e8c61d05c32480d10fd30fd01920f8be15bfce6c96291fc857cab9aa7de42bbb45ccb0ea5309381f8')

package() {
    install -Dm0755 polars -t "$pkgdir/usr/bin/"
}
# vim:set noet sts=0 sw=4 ts=4 ft=PKGBUILD:
