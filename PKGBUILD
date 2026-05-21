# Maintainer: Network_Jack <Network_Jack@null.net>

pkgname=thunar-secure-delete
pkgver=1.0.0
pkgrel=1
pkgdesc="Secure Erase Menu Item for Thunar"
arch=('any')
url="https://github.com/NetworkJack2/secure_delete_thunar"
license=('GPLv3')
depends=('yad' 'libnotify')
source=(${pkgname}-${pkgver}.tar.gz::"https://github.com/GIJack/secure_delete_thunar/archive/${pkgver}.tar.gz")
sha256sums=('9a11f717cd48084c57848186ebc71a443931de1f7ad5e4f01f32060a9b3ff92a')

package() {
  cd "secure_delete_thunar-${pkgver}"
  make DESTDIR="${pkgdir}" PREFIX="usr/" install
}

