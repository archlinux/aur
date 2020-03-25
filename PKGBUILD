# Maintainer: Sergey A. <murlakatamenka@disroot.org>

pkgname=zenith-bin
pkgver=0.7.6
pkgrel=1
pkgdesc="Terminal system monitor with histograms, written in Rust"
arch=('x86_64')
url="https://github.com/bvaisvil/zenith"
license=('MIT')
provides=('zenith')
conflicts=('zenith')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/$pkgver/zenith.linux.tgz")
md5sums=('17f8aaf67bbfdc0b40d26a8d2927d628')

package() {
    install -Dm 755 "zenith" "$pkgdir/usr/bin/zenith"
}
