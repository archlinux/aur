# Maintainer: Jordan Day < jordanday444 at gmail dot com >

pkgname=dblab
pkgver=0.18.0
pkgrel=1
pkgdesc="Interactive client for PostgreSQL, MySQL and SQLite3."
arch=('x86_64')
url="https://github.com/danvergara/dblab"
source=("https://github.com/danvergara/dblab/releases/download/v$pkgver/${pkgname}_${pkgver}_linux_amd64.tar.gz")
sha256sums=('34fed91de9f5c885d591dccf0d9bf98a486ef09c9454226d67e4569470eb35f5')
license=('MIT')

package() {
    mkdir -p "$pkgdir/usr/bin"
    tar -xzf ${pkgname}_${pkgver}_linux_amd64.tar.gz -C "$pkgdir/usr/bin"
}
