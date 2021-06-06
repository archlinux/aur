# Maintainer: LuanCamarim <https://github.com/LuanCamarim>
# 
# Contributor: Alexandr Vasilyev <https://github.com/alex-s-v>


pkgname=10moons-driver-t503
pkgver=1.0
pkgrel=10
pkgdesc="Driver fer tablet 10moons T503"
arch=(i686 x86_64)
url="https://github.com/alex-s-v/10moons-driver.git"
license=('custom')
depends=(python)
makedepends=(python)
source=("https://github.com/LuanCamarim/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('SKIP')

package() {
  cd ${pkgname}-${pkgver}

  make DESTDIR="${srcdir}" install
  chmod +x install.sh
  ./install.sh
}
