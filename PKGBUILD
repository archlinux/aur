pkgname=sph-pack-git
_gitname=sph-pack
pkgver=e43ba6d
pkgrel=1
pkgdesc="free software file packaging solution. compounding/compression/encryption and the rerverse with only one standard file format per task"
arch=(any)
license=(gpl3)
makedepends=(git)
provides=(pack)
depends=(sph-lib-git tar xz scrypt)
conflicts=(sph-pack)
source=("git://sph.mn/sph-pack")
url="http://sph.mn"
md5sums=(SKIP)

pkgver() {
  cd $_gitname
  git log -n 1 --pretty=format:"%h"
}

package() {
  cd $_gitname
  ./exec/install "$pkgdir"
}
