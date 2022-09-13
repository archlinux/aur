# Maintainer: Jordan Day < jordanday444 at gmail dot com >

pkgname=dblab
pkgver=0.16.0
pkgrel=1
pkgdesc="Interactive client for PostgreSQL, MySQL and SQLite3."
arch=('x86_64')
url="https://github.com/danvergara/dblab"
source=("https://github.com/danvergara/dblab/releases/download/v$pkgver/${pkgname}_${pkgver}_linux_amd64.tar.gz")
sha256sums=('85fb20b0ef0de0ed7235ddc868cd91d2d3553ccb052a3eb06cfe70f235a69b4d')
license=('MIT')

package() {
    mkdir -p "$pkgdir/usr/bin"
    tar -xzf ${pkgname}_${pkgver}_linux_amd64.tar.gz -C "$pkgdir/usr/bin"
}
