#Maintainer: Julian Marcos <julian08@cock.li>

pkgname=bfetch-git
_gitname="bfetch"
pkgver=bc48bda12bcc61d2592c5c0aea0a393220fab042
pkgrel=1
pkgdesc="Simple Fetch program written in bash"
arch=('any')
url="https://gitlab.com/nautilor/bfetch"
license=('custom')
makedepends=('git')
optdepends=('')
provides=("bfetch")
conflicts=("bfetch")
source=('git+https://gitlab.com/nautilor/bfetch')
md5sums=('SKIP')

pkgver() {
  cd $_gitname
  git log | head -1 | cut -d ' ' -f2
}

prepare() {
  cd $_gitname
}

build() {
  cd $_gitname
}

package() {
  cd $_gitname
  mkdir -p "${pkgdir}/usr/bin"
  mv "bfetch" "${pkgdir}/usr/bin/bfetch"
}
