# Maintainer: Sergey A. <murlakatamenka@disroot.org>

pkgname=zenith-bin
pkgver=0.10.1
pkgrel=1
pkgdesc="Terminal system monitor with histograms, written in Rust"
arch=('x86_64')
url="https://github.com/bvaisvil/zenith"
license=('MIT')
provides=('zenith')
conflicts=('zenith')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/$pkgver/zenith.x86_64-unknown-linux-musl.tgz")
md5sums=('c23fedfa6a8c0a233332ad7edc3300c2')

package() {
    install -Dm 755 "zenith" "$pkgdir/usr/bin/zenith"
}
