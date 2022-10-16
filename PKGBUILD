# Maintainer: Paul Spruce <paul.spruce@gmail.com>
_pkgname=unfurl
pkgname=unfurl-bin
pkgver=0.4.3
pkgrel=1
pkgdesc="Pull out bits of URLs provided on stdin"
arch=("x86_64")
url="https://github.com/tomnomnom/unfurl"
license=("MIT")
provides=("unfurl")
conflicts=("unfurl")
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/$_pkgname-linux-amd64-$pkgver.tgz")
b2sums=('SKIP')

package() {
    install -Dm755 $_pkgname -t "$pkgdir/usr/bin/"
}
