#Maintainer: Julian Marcos <julian08@cock.li>

pkgname=supermk-git
_gitname="mk"
pkgver=r9.a65f7a2
pkgrel=1
pkgdesc="SuperB way to create new folders and files"
arch=('any')
url="https://github.com/NNBnh/bfetch"
license=('custom')
makedepends=('git')
provides=("mk")
conflicts=("mk-git")
source=('git+https://github.com/NNBnh/mk')
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
  mv "bin/mk" "${pkgdir}/usr/bin/mk"
}
