pkgname=sph-pack-git
pkgver=42
pkgrel=1
pkgdesc="free software file packaging solution. compounding/compression/encryption with tar/xz/gz/scrypt"
arch=(any)
license=(gpl3)
makedepends=(git)
provides=(sph-pack)
depends=(sph-lib tar xz)
optdepends=(scrypt)
conflicts=(sph-pack)
source=("git://git.sph.mn/sph-pack")
url="http://sph.mn"
md5sums=(SKIP)

pkgver() {
  cd sph-pack
  git rev-list --count HEAD
}

package() {
  cd sph-pack
  ./exe/install --prefix="$pkgdir"
}
