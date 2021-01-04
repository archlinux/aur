#Maintainer: Julian Marcos <julian08@cock.li>

pkgname=superbfetch-git
_gitname="bfetch"
pkgver=r46.16173cf
pkgrel=1
pkgdesc="Dynamic fetch displayer that SuperB"
arch=('any')
url="https://github.com/NNBnh/bfetch"
license=('custom')
makedepends=('git')
provides=("bfetch")
conflicts=("bfetch-git")
source=('git+https://github.com/NNBnh/bfetch')
md5sums=('SKIP')

pkgver() {
  cd "$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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
