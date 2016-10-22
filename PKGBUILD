pkgname=sph-sc-git
pkgver=51
pkgrel=1
pkgdesc='scheme-like s-expression language that translates to c'
arch=(any)
license=(gpl3)
makedepends=(git)
depends=(guile sph-lib)
provides=(sph-sc)
source=("$pkgname::git://git.sph.mn/sph-sc#branch=stable")
url="http://sph.mn/content/3d3"
md5sums=(SKIP)

pkgver() {
  cd $pkgname
  git rev-list --count HEAD
}

package() {
  cd $pkgname
  ./exe/install --prefix="${pkgdir}"
}