# Maintainer: leo <leo at niko dot undo dot it>

pkgname=user-foxy-cli
pkgver=1.0.0
pkgrel=1
pkgdesc="CLI for the Foxy API — paste sharing, URL shortener, and remote server control"
arch=('any')
url="http://niko.undo.it"
license=('MIT')
depends=('curl' 'python')
source=("foxy::https://niko.undo.it/get-foxy")
sha256sums=('f140b5aa12c95d88b0812f2e3c1d5ba9c4f3df53897585bfa2a77a07c780102f')

package() {
    install -Dm755 "$srcdir/foxy" "$pkgdir/usr/local/bin/foxy"
}
