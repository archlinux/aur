pkgname=sph-sc-git
pkgver=157
pkgrel=1
pkgdesc="compiles scheme-like s-expressions to c"
arch=(any)
license=(gpl3)
makedepends=(git)
depends=(guile sph-lib)
provides=(sph-sc)
source=("git://git.sph.mn/sph-sc")
url="http://sph.mn"
md5sums=(SKIP)

pkgver() {
  cd sph-sc
  git rev-list --count HEAD
}

package() {
  cd sph-sc
  ./exe/install --prefix="${pkgdir}"
}