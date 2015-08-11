pkgname=sph-sc-git
pkgver=9661cbb
pkgrel=1
pkgdesc='a scheme syntax to c compiler'
arch=(any)
license=(GPL3)
makedepends=(git gcc)
depends=(guile sph-lib-git)
provides=(sph-sc)
source=("git://git.sph.mn/sph-sc")
url="http://sph.mn/content/3d3"
md5sums=(SKIP)

pkgver() {
  cd sph-sc
  git log -n 1 --pretty=format:"%h"
}

package() {
  cd sph-sc
  ./exec/install "${pkgdir}"
  chmod 755 -R "${pkgdir}"
}