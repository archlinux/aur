# Maintainer: Nima Askarian <nimaaskarian.work@outlook.com>
pkgname=c3-bin
pkgver=1.7.0
pkgrel=1
_gitname=c3
pkgdesc="A TUI to-do list that uses and extends calcurse format to have tree-like dependencies."
url="https://github.com/nimaaskarian/${_gitname}"
conflicts=(c3)

provides=(c3)
arch=('x86_64')
license=('GPL3')
optdepends=('potato-c: pomodoro timer module')

source=(
  "${pkgname}::https://github.com/nimaaskarian/${_gitname}/releases/download/${pkgver}/c3.x86.linux"
)

md5sums=('12f095140d5794a36b774cef1a4246c0')

package () {
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/c3"
}
