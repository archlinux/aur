# Maintainer: Patryk Szalanski <patryk.szalanski+aur@gmail.com>

_name=sabermod-prebuilts
pkgname=$_name
pkgver=2015.05.22
pkgrel=1
pkgdesc='Prebuilt libraries for the SaberMod toolchain.'
arch=('any')
url='http://sabermod.net/'
license=('GPL')
depends=()
makedepends=('zip')
provides=($_name)
conflicts=($_name)
options=('!emptydirs')
source=("http://oceighty.co/sm/$_name-$pkgver.zip")
sha256sums=('SKIP')

build() {
  cd $_name-$pkgver
  echo "Building."
}

package() {
  cd $_name-$pkgver
  bash installprebuilts.sh
}
