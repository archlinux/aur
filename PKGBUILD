# Maintainer: Jordan Day < jordanday444 at gmail dot com >

pkgname=dblab-bin
_pkgname=dblab
pkgver=0.26.0
pkgrel=1
pkgdesc="Interactive client for PostgreSQL, MySQL and SQLite3."
arch=('x86_64')
url="https://github.com/danvergara/dblab"
source=("https://github.com/danvergara/dblab/releases/download/v$pkgver/${_pkgname}_${pkgver}_linux_amd64.tar.gz")
sha256sums=('405da0d9602fc5a7de9ccb03e72db60ab1c069b4b47cd71e05bb93148ab3e977')
license=('MIT')

package() {
    mkdir -p "$pkgdir/usr/bin"
    tar -xzf ${_pkgname}_${pkgver}_linux_amd64.tar.gz -C "$pkgdir/usr/bin"
}
