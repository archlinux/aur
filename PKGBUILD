pkgname=sescript-git
pkgver=31
pkgrel=1
pkgdesc='a scheme syntax to ecmascript and javascript compiler'
arch=(any)
license=(gpl3+)
makedepends=(git)
depends=("guile>=2" sph-lib)
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
  ./exe/install "${pkgdir}"
}