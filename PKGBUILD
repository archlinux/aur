# Maintainer: Paul Spruce <paul.spruce@gmail.com>
pkgname=shosubgo-bin
pkgver=2.0
pkgrel=1
pkgdesc="Small tool to Grab subdomains using Shodan api."
arch=("x86_64")
url="https://github.com/incogbyte/shosubgo"
license=(unknown)
source=("$url/releases/download/2.0/shosubgo_linux")
b2sums=('SKIP')

package() {
    install -Dm755 shosubgo_linux -t "$pkgdir/usr/bin"
}
