# Contributor: Thomas Dziedzic < gostrc at gmail >

_pkgname=memoir
pkgname=memoir-git
pkgver=r7.2d73a99
pkgrel=1
pkgdesc='minimal cli diary'
arch=('any')
url='https://github.com/gostrc/memoir'
license=('unknown')
depends=('python')
makedepends=('git')
source=('git://github.com/gostrc/memoir.git')
md5sums=('SKIP')


pkgver() {
  cd $_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd ${_pkgname}

  install -d ${pkgdir}/usr/bin
  install m ${pkgdir}/usr/bin
}
