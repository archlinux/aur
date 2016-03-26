pkgname=sph-pack-git
pkgver=21
pkgrel=1
pkgdesc="free software file packaging solution. compounding/compression/encryption and the rerverse with only one standard file format per task"
arch=(any)
license=(gpl3)
makedepends=(git)
provides=(sph-pack)
depends=(sph-lib tar xz)
optdepends=(scrypt)
conflicts=(sph-pack)
source=("$pkgname::git://git.sph.mn/sph-pack#branch=stable")
url="http://sph.mn"
md5sums=(SKIP)

pkgver() {
  cd $pkgname
  git rev-list --count HEAD
}

package() {
  cd $pkgname
  ./exe/install --prefix="$pkgdir"
}
