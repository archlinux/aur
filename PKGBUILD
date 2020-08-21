# Maintainer: Dusan Mitrovic <dusan@dusanmitrovic.xyz>
pkgname=hosts-modifier
pkgver=1.0.8
pkgrel=1
pkgdesc='A small go program used to manage the hosts file.'
arch=('x86_64')
url='https://github.com/BrosSquad/hosts'
license=('GPL')
source=('https://github.com/BrosSquad/hosts/archive/v1.0.8.tar.gz')
makedepends=(go)
md5sums=('1027d27526a794bc9e8f9b9177d3a3df')
sha256sums=('1600c0513d96b5a338d41ad769d62a0da40729cae1097bcee64b3c0b8349477f')

build() {
    cd "hosts-$pkgver"
    go build
}

package() {
    cd "hosts-$pkgver"
    mkdir -p "$pkgdir/usr/bin/"
    mv hosts "$pkgdir/usr/bin/hosts"
}
