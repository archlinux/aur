pkgname=sescript-git
pkgver=93
pkgrel=1
pkgdesc="compiles scheme-like s-expressions to ecmascript/javascript"
arch=(any)
license=(gpl3+)
makedepends=(git)
depends=(guile sph-lib)
provides=(sescript)
conflicts=(sescript)
source=("git://git.sph.mn/sescript")
url="http://sph.mn"
md5sums=(SKIP)

pkgver() {
  cd sescript
  git rev-list --count HEAD
}

package() {
  cd sescript
  ./exe/install "$pkgdir"
}