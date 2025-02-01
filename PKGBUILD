# Maintainer: Simon Cruanes <simon.cruanes.2007@m4x.org>
pkgname=dolmenls
pkgver=0.10
pkgrel=0
pkgdesc="LSP server for Dolmen, a tool for logic and theorem proving."
arch=('x86_64')
url="https://github.com/gbury/dolmen"
license=('BSD-2-Clauses')
depends=()
source=("https://github.com/Gbury/dolmen/releases/download/v${pkgver}/dolmenls-linux-amd64")
md5sums=('83a440e6c8e217342eb583b10833cbd3')

package() {
  install -D dolmenls-linux-amd64 "$pkgdir/usr/bin/dolmenls"
}

