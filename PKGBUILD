# Maintainer: Manoj Karthick Selva Kumar
pkgname=reddsaver-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="CLI tool to download saved media from Reddit"
url="https://github.com/manojkarthick/reddsaver"
license=("MIT/Apache-2.0")
arch=("x86_64")
provides=("reddsaver")
options=("strip")
source=("https://github.com/manojkarthick/reddsaver/releases/download/v$pkgver/reddsaver-$pkgver-x86_64.tar.gz")
sha256sums=("b0d87f92f21c17774f01e7cc4c2217297ae062c1456e57448eec58894efbb626")

package() {
    install -Dm755 reddsaver -t "$pkgdir/usr/bin/"
}
