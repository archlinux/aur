# Maintainer: kitsunyan <kitsunyan@inbox.ru>
# Contributor: Grigorii Horos <horosgrisa@gmail.com>

pkgname=papirus-icon-theme
pkgver=20171102
pkgrel=1
pkgdesc="Papirus icon theme"
arch=('any')
url="https://github.com/PapirusDevelopmentTeam/papirus-icon-theme"
license=("LGPL3")
depends=('gtk-update-icon-cache')
provides=('papirus-icon-theme')
conflicts=('papirus-icon-theme-git')
options=(!strip) # stripping takes much time but does nothing
source=("$pkgname-$pkgver.tar.gz::https://github.com/PapirusDevelopmentTeam/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('8a8859e4237988317b9a528b3b0b2ddd1e877e00fe4dff949d9c307ec5307be8')

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
