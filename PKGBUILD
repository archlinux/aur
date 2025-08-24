# Maintainer: Network_Jack <Network_Jack@null.net>

pkgname=thunar-secure-delete
pkgver=0.9.2
pkgrel=1
pkgdesc="Secure Erase Menu Item for Thunar"
arch=('any')
url="https://github.com/NetworkJack2/secure_delete_thunar"
license=('GPLv3')
depends=('xdialog' 'libnotify')
source=(${pkgname}-${pkgver}.tar.gz::"https://github.com/GIJack/secure_delete_thunar/archive/${pkgver}.tar.gz")
sha256sums=('09de75f8e706840ee854b751fbc92249e1061e70636a95b7b7acdffa5b8e13da')

package() {
  cd "secure_delete_thunar-${pkgver}"
  make DESTDIR="${pkgdir}" PREFIX="usr/" install
}

