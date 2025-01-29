# Maintainer: tee < teeaur at duck dot com >
pkgname=polars-cli-bin
pkgver=0.9.0
pkgrel=1
pkgdesc="CLI interface for running SQL queries with Polars as backend"
arch=(x86_64)
url="https://github.com/pola-rs/polars-cli"
license=('MIT')
source=("https://github.com/pola-rs/polars-cli/releases/download/$pkgver/polars-cli-$pkgver-$arch-unknown-linux-gnu.tar.gz")
b2sums=('0bf8200f36c87c6f40e8d2c11eecfcc0f7244d778e87ecfb37411f75f8076892f9b61397b7ca074ed1e997f4b1879c14598335bf1d04f724f046d8a4108672d8')

package() {
    install -Dm0755 polars -t "$pkgdir/usr/bin/"
}
# vim:set noet sts=0 sw=4 ts=4 ft=PKGBUILD:
