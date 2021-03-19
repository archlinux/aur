# Maintainer: Manoj Karthick Selva Kumar <manojkarthick@ymail.com>
pkgname=reddsaver-bin
pkgver=0.3.2
pkgrel=1
pkgdesc="CLI tool to download saved media from Reddit"
url="https://github.com/manojkarthick/reddsaver"
license=("MIT/Apache-2.0")
arch=("x86_64")
provides=("reddsaver")
options=("strip")
source=("https://github.com/manojkarthick/reddsaver/releases/download/v$pkgver/reddsaver-$pkgver-x86_64.tar.gz")
sha256sums=("3f4d65f7c79f35cdf67752dd6c543a6237e4951d4144db0132731e2e9c5b8c58")

package() {
    install -Dm755 reddsaver -t "$pkgdir/usr/bin/"
}
