# Maintainer: paperbenni <paperbenni@gmail.com>
_pkgname=islide
pkgname=$_pkgname
pkgver=202005101801
pkgrel=1
pkgdesc="slider for instantOS"
url="https://github.com/instantos/islide"
arch=('any')
license=('MIT')
depends=('sh' 'libxinerama' 'libxft')
makedepends=('git')
provides=(islide)
conflicts=(islide)
source=("$_pkgname::git+https://github.com/instantOS/islide.git")

sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  echo "$(date '+%Y%m%d%H%M')"
}

prepare() {
  cd $_pkgname
  echo "no prepare"
}

build() {
  cd $_pkgname
}

package() {

  cd $_pkgname
  make
  ls
  mkdir -p ${pkgdir}/usr/bin
  mv islide "${pkgdir}"/usr/bin/islide
  chmod +x "${pkgdir}"/usr/bin/islide
}
