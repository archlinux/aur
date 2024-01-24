# Maintainer: Nima Askarian <nimaas1400@gmail.com>
pkgname=c3-bin
pkgver=0.3.1
pkgrel=1
_gitname=c3
pkgdesc="A TUI to-do list that uses and extends calcurse format to have tree-like dependencies."
url="https://github.com/nimaaskarian/${_gitname}"

provides=(c3)
arch=('x86_64')
license=('GPL3')
optdepends=('potato-c: pomodoro timer module')

source=(
  "${pkgname}::https://github.com/nimaaskarian/${_gitname}/releases/download/${pkgver}/c3.x86.linux"
)

md5sums=('5321c1cf2b4621b21f3c912e0374759d')

package () {
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/c3"
}
