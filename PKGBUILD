# Maintainer: Jordan Day < jordanday444 at gmail dot com >

pkgname=dblab-bin
_pkgname=dblab
pkgver=0.24.1
pkgrel=1
pkgdesc="Interactive client for PostgreSQL, MySQL and SQLite3."
arch=('x86_64')
url="https://github.com/danvergara/dblab"
source=("https://github.com/danvergara/dblab/releases/download/v$pkgver/${_pkgname}_${pkgver}_linux_amd64.tar.gz")
sha256sums=('a86f0a3e55fd7ffdbc4f9e49ca118598ad62cf494a7cb9612815c38ecfdd4d37')
license=('MIT')

package() {
    mkdir -p "$pkgdir/usr/bin"
    tar -xzf ${_pkgname}_${pkgver}_linux_amd64.tar.gz -C "$pkgdir/usr/bin"
}
