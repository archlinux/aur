_name=sph-web-app
pkgname=$_name-git
pkgver=145
pkgrel=1
pkgdesc="guile scheme framework for dynamic websites"
arch=(any)
license=(gpl3+)
makedepends=(git)
depends=(guile sph-lib)
provides=($_name)
conflicts=($_name)
source=("git://git.sph.mn/$_name")
url="http://sph.mn"
md5sums=(SKIP)

pkgver() {
  cd $_name
  git rev-list --count HEAD
}

package() {
  cd $_name
  ./exe/install --target-prefix="$pkgdir"
}