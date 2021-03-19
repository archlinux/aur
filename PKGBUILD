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
sha256sums=("97eec609728442097b84e4e6574aa9c1f3d0240243addae85f0bcc485c419ccd")

package() {
    install -Dm755 reddsaver -t "$pkgdir/usr/bin/"
}
