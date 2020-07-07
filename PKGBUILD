# Maintainer: Sergey A. <murlakatamenka@disroot.org>

pkgname=zenith-bin
pkgver=0.10.0
pkgrel=1
pkgdesc="Terminal system monitor with histograms, written in Rust"
arch=('x86_64')
url="https://github.com/bvaisvil/zenith"
license=('MIT')
provides=('zenith')
conflicts=('zenith')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/$pkgver/zenith.x86_64-unknown-linux-musl.tgz")
md5sums=('4973954ebb4e3612e25e19cb03b564c5')

package() {
    install -Dm 755 "zenith" "$pkgdir/usr/bin/zenith"
}
