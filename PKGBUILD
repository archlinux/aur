# Maintainer: Gabriel Oliveira da Silva <glcbofs@proton.me>
pkgname=blindpaste
pkgver=1.5.5
pkgrel=1
pkgdesc="a TUI blackboard for quick note taking"
arch=("x86_64")
url="https://projectgrid.net/portfolio/blindpaste"
license=("0BSD")
optdepends=("bash-completion: for command line completions when pressing the <tab> key")
install="advice.install"
source=("${pkgname}-${pkgver}.tar.xz::https://projectgrid.net/archive/${pkgname}-${pkgver}.tar.xz")

sha256sums=('cc0fa25c9c486fe2ecb85b7a448a97e832c4a4bc28d5f22186ca184235c00b67')

build()
{
  make
}

package()
{
  make DESTDIR="$pkgdir" install
}
