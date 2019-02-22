pkgname=sph-web-app-git
pkgver=139
pkgrel=1
pkgdesc="guile scheme framework for dynamic websites"
arch=(any)
license=(gpl3+)
makedepends=(git)
depends=(guile sph-lib)
provides=(sph-web-app)
conflicts=(sph-web-app)
source=("git://git.sph.mn/sph-web-app")
url="http://sph.mn"
md5sums=(SKIP)

pkgver() {
  cd sph-web-app
  git rev-list --count HEAD
}

package() {
  cd sph-web-app
  ./exe/install --prefix="${pkgdir}"
}