# Maintainer: Sergey A. <murlakatamenka@disroot.org>

pkgname=zenith-bin
pkgver=0.8.2
pkgrel=1
pkgdesc="Terminal system monitor with histograms, written in Rust"
arch=('x86_64')
url="https://github.com/bvaisvil/zenith"
license=('MIT')
provides=('zenith')
conflicts=('zenith')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/$pkgver/zenith.linux.tgz")
md5sums=('3d8d83caf236179df6b7ef1f1b0c44a4')

package() {
    install -Dm 755 "zenith" "$pkgdir/usr/bin/zenith"
}
