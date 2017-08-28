# Maintainer: kitsunyan <kitsunyan@inbox.ru>
# Contributor: Grigorii Horos <horosgrisa@gmail.com>

pkgname=papirus-icon-theme
pkgver=20170828
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
sha256sums=('661ed89eb7be4ffc6501dab3402bef78d3e2acfe8e10db14338b665bff54fb97')

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
