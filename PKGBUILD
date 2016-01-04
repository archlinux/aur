pkgname=swconfig
pkgver=20150806
pkgrel=2
pkgdesc="project to package the swconfig utility from OpenWRT for archlinuxarm on BPi-R1"
url="https://github.com/rains31/swconfig"
license=('GPL2')
depends=('libnl')
makedepends=('gcc' 'linux-headers')
provides=(${pkgname})
conflicts=(${pkgname})
options=()
arch=('armv7h')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/rains31/swconfig/archive/${pkgver}.tar.gz)
sha1sums=(
    '3e058ba7f2ea462a5d823c96afa69b93084f1737'
)

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  make
  make install DESTDIR=$pkgdir
} 
