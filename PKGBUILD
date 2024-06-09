# Maintainer: Jordan Day < jordanday444 at gmail dot com >

pkgname=dblab-bin
_pkgname=dblab
pkgver=0.24.0
pkgrel=1
pkgdesc="Interactive client for PostgreSQL, MySQL and SQLite3."
arch=('x86_64')
url="https://github.com/danvergara/dblab"
source=("https://github.com/danvergara/dblab/releases/download/v$pkgver/${_pkgname}_${pkgver}_linux_amd64.tar.gz")
sha256sums=('741f52e26eb1407d2d7cde7bebb8d02ca90382adef64fe6cec0a5c5b36f6af8d')
license=('MIT')

package() {
    mkdir -p "$pkgdir/usr/bin"
    tar -xzf ${_pkgname}_${pkgver}_linux_amd64.tar.gz -C "$pkgdir/usr/bin"
}
