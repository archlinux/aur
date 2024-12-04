# Maintainer: Jordan Day < jordanday444 at gmail dot com >

pkgname=dblab-bin
_pkgname=dblab
pkgver=0.29.0
pkgrel=1
pkgdesc="Interactive client for PostgreSQL, MySQL and SQLite3."
arch=('x86_64')
url="https://github.com/danvergara/dblab"
source=("https://github.com/danvergara/dblab/releases/download/v$pkgver/${_pkgname}_${pkgver}_linux_amd64.tar.gz")
sha256sums=('60809e5acb4a861155c619d2d5df6c441a6eb336d4f3cd0737026198abb50ec1')
license=('MIT')

package() {
    mkdir -p "$pkgdir/usr/bin"
    tar -xzf ${_pkgname}_${pkgver}_linux_amd64.tar.gz -C "$pkgdir/usr/bin"
}
