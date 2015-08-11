pkgname=sph-web-app-git
_gitname=sph-web-app
pkgver=ab51f30
pkgrel=1
pkgdesc='framework for creating web applications with guile scheme'
arch=(any)
license=(GPL3)
makedepends=(git)
depends=(guile sph-lib)
provides=(sph-web-app)
conflicts=(sph-web-app)
source=("git://git.sph.mn/sph-web-app")
url="http://sph.mn/content/66b"
md5sums=(SKIP)

pkgver() {
  cd $_gitname
  git log -n 1 --pretty=format:"%h"
}

package() {
  cd $_gitname
  chmod 755 -R .
  ./exec/install "${pkgdir}"
}