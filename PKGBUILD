# Maintainer: Gabriel Oliveira da Silva <glcbofs@proton.me>
pkgname=blindpaste
pkgver=1.2.1
pkgrel=1
pkgdesc="a TUI blackboard for quick note taking"
arch=("x86_64")
url="https://projectgrid.net/portfolio/blindpaste"
license=("0BSD")
optdepends=("bash-completion: for command line completions when pressing the <tab> key")
install="advice.install"
source=("${pkgname}-${pkgver}.tar.xz::https://projectgrid.net/archive/${pkgname}-${pkgver}.tar.xz")

sha256sums=('0221efde14c73c6abf5786396dafca9baa6cb6ae67a49b36c18b363b89114098')

build()
{
  make
}

package()
{
  make DESTDIR="$pkgdir" install
}
