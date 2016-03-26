pkgname=sph-web-app-git
pkgver=33
pkgrel=1
pkgdesc='framework for creating web applications with guile scheme'
arch=(any)
license=(gpl3+)
makedepends=(git)
depends=(guile sph-lib)
provides=(sph-web-app)
conflicts=(sph-web-app)
source=("$pkgname::git://git.sph.mn/sph-web-app#branch=stable")
url="http://sph.mn/content/66b"
md5sums=(SKIP)

pkgver() {
  cd $pkgname
  git rev-list --count HEAD
}

package() {
  cd $pkgname
  ./exe/install --prefix="${pkgdir}"
}