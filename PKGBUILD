pkgname=sph-lib-git
pkgver=181
pkgrel=1
pkgdesc='set of more than 80 guile scheme libraries'
arch=(any)
license=(gpl3+)
makedepends=(git)
depends=("guile>=2")
provides=(sph-lib)
conflicts=(sph-lib)
source=("$pkgname::git://git.sph.mn/sph-lib#branch=stable")
url="http://sph.mn/content/187"
md5sums=(SKIP)

pkgver() {
  cd $pkgname
  git rev-list --count HEAD
}

package() {
  cd $pkgname
  ./exe/install "${pkgdir}"
}