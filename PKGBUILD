# Maintainer: Héctor Molinero Fernández <hector at molinero dot dev>
# Contributor: Erazem Kokot <contact at erazem dot eu>
pkgname='hblock'
pkgver='3.1.2'
pkgrel='1'
pkgdesc='An adblocker that creates a hosts file from automatically downloaded sources'
arch=('any')
url='https://github.com/hectorm/hblock'
license=('MIT')
depends=('curl')
source=("https://github.com/hectorm/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('4bd2cb120ed85ac6fb376387b25a6031ce65b89647b15ccd5db8564c8593c2cd')

package() {
  cd -- "${pkgname:?}-${pkgver:?}"
  make DESTDIR="${pkgdir:?}" prefix="/usr" install
}
