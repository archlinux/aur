# Maintainer: kitsunyan <kitsunyan@inbox.ru>
# Contributor: Grigorii Horos <horosgrisa@gmail.com>

pkgname=papirus-icon-theme
pkgver=20171007
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
sha256sums=('15e031cdf940de852b75666ddbcc112d7e0ec0da090f784b6459bd5db0045509')

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
