_name=sph-sc
pkgname=$_name-git
pkgver=224
pkgrel=1
pkgdesc="compiles scheme-like s-expressions to c"
arch=(any)
license=(gpl3)
makedepends=(git)
depends=(guile sph-lib)
provides=($_name)
source=("git://sph.mn/$_name")
url="http://sph.mn"
md5sums=(SKIP)

pkgver() {
  cd $_name
  git rev-list --count HEAD
}

package() {
  cd $_name
  ./exe/install --target-prefix="${pkgdir}"
}