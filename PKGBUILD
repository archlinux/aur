pkgname=sescript-git
pkgver=45
pkgrel=1
pkgdesc='scheme-like s-expression language that translates to ecmascript/javascript'
arch=(any)
license=(gpl3+)
makedepends=(git)
depends=(guile sph-lib)
provides=(sescript)
conflicts=(sescript)
source=("$pkgname::git://git.sph.mn/sescript#branch=stable")
url="http://sph.mn"
md5sums=(SKIP)

pkgver() {
  cd $pkgname
  git rev-list --count HEAD
}

package() {
  cd $pkgname
  ./exe/install --prefix="${pkgdir}"
}