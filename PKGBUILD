# Maintainer: Gabriel Oliveira da Silva <glcbofs@proton.me>
pkgname=blindpaste
pkgver=1.6.1
pkgrel=1
pkgdesc="a TUI blackboard for quick note taking"
arch=("x86_64")
url="https://projectgrid.net/portfolio/blindpaste"
license=("0BSD")
install="advice.install"
source=("${pkgname}-${pkgver}.tar.xz::https://projectgrid.net/archive/${pkgname}-${pkgver}.tar.xz")
sha256sums=('d924d71bb8edd8196f7970fc2e9ec3d8eb3a550b57d36436914575eb4e738f4b')

optdepends=("bash-completion: for command line completions when pressing the <tab> key")

build()
{
  make
}

package()
{
  make DESTDIR="$pkgdir" install
}
