# Maintainer: Jordan Day < jordanday444 at gmail dot com >

pkgname=dblab
pkgver=0.21.0
pkgrel=1
pkgdesc="Interactive client for PostgreSQL, MySQL and SQLite3."
arch=('x86_64')
url="https://github.com/danvergara/dblab"
source=("https://github.com/danvergara/dblab/releases/download/v$pkgver/${pkgname}_${pkgver}_linux_amd64.tar.gz")
sha256sums=('7b971e55decad7951f054bde24b2bf34baff5e3e964b7a9d122f5c9d8fca416d')
license=('MIT')

package() {
    mkdir -p "$pkgdir/usr/bin"
    tar -xzf ${pkgname}_${pkgver}_linux_amd64.tar.gz -C "$pkgdir/usr/bin"
}
