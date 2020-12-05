# Maintainer: Héctor Molinero Fernández <hector at molinero dot dev>
# Contributor: Erazem Kokot <contact at erazem dot eu>
pkgname='hblock'
pkgver='3.1.1'
pkgrel='1'
pkgdesc='An adblocker that creates a hosts file from automatically downloaded sources'
arch=('any')
url='https://github.com/hectorm/hblock'
license=('MIT')
depends=('curl')
source=("https://github.com/hectorm/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('7d87002c8ba13b72b4614fd2e528dfee816ea632ddee7f49be7cc463b43b6c3c')

package() {
  cd -- "${pkgname:?}-${pkgver:?}"
  make DESTDIR="${pkgdir:?}" prefix="/usr" install
}
