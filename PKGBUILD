# Maintainer: tee < teeaur at duck dot com >
pkgname=polars-cli-bin
pkgver=0.7.0
pkgrel=1
pkgdesc="CLI interface for running SQL queries with Polars as backend"
arch=(x86_64)
url="https://github.com/pola-rs/polars-cli"
license=('MIT')
source=("https://github.com/pola-rs/polars-cli/releases/download/$pkgver/polars-cli-$pkgver-$arch-unknown-linux-gnu.tar.gz")
b2sums=('22c54d9570263bea380afa75f99a55bb6f7c984ec74344175e68081d6863dd7349b64e694b2c7de9621d3506947a7cd735c20c50feea4c9d0991bc50c663f4ac')

package() {
    install -Dm0755 polars -t "$pkgdir/usr/bin/"
}
# vim:set noet sts=0 sw=4 ts=4 ft=PKGBUILD:
