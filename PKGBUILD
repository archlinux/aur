#Maintainer: Julian Marcos <julian08@cock.li>

pkgname=bfetch-github-git
_gitname="bfetch"
pkgver=67330568d1a5ff93c5354567e7e70349df34ed43
pkgrel=1
pkgdesc="Simple Fetch program written in bash"
arch=('any')
url="https://github.com/NNBnh/bfetch"
license=('custom')
makedepends=('git')
provides=("bfetch")
conflicts=("bfetch-git")
source=('git+https://github.com/NNBnh/bfetch')
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
