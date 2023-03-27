# Maintainer: Jordan Day < jordanday444 at gmail dot com >

pkgname=dblab
pkgver=0.19.0
pkgrel=1
pkgdesc="Interactive client for PostgreSQL, MySQL and SQLite3."
arch=('x86_64')
url="https://github.com/danvergara/dblab"
source=("https://github.com/danvergara/dblab/releases/download/v$pkgver/${pkgname}_${pkgver}_linux_amd64.tar.gz")
sha256sums=('fbf93dc960d46bf88766b9d49c9ff7068f2b6ae975178ae848f63a7500b78b60')
license=('MIT')

package() {
    mkdir -p "$pkgdir/usr/bin"
    tar -xzf ${pkgname}_${pkgver}_linux_amd64.tar.gz -C "$pkgdir/usr/bin"
}
