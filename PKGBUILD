# Maintainer: Nima Askarian <nimaas1400@gmail.com>
pkgname=c3-bin
pkgver=0.4.2
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

md5sums=('1547b501224edd82abda7518a8222eb8')

package () {
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/c3"
}
