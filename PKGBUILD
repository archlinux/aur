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
sha256sums=("fdeb5ff25beef78c90fa3b0c08d0c7a485b54132932a8da045dc28e127e13832")

package() {
    install -Dm755 reddsaver -t "$pkgdir/usr/bin/"
}
