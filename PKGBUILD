# Maintainer: Paul Spruce <paul.spruce@gmail.com>
_pkgname=shosubgo
pkgname=shosubgo-bin
pkgver=2.0
pkgrel=2
pkgdesc="Small tool to Grab subdomains using Shodan api."
arch=("x86_64")
url="https://github.com/incogbyte/shosubgo"
license=("unknown")
provides=("shosubgo")
conflicts=("shosubgo")
source=("$url/releases/download/2.0/shosubgo_linux")
noextract=("${_pkgname}_linux")
b2sums=('SKIP')

package() {
    install -Dm755 ${_pkgname}_linux -t "$pkgdir/usr/bin/"
}
