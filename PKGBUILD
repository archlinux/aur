# Maintainer: kitsunyan <kitsunyan@inbox.ru>
# Contributor: Grigorii Horos <horosgrisa@gmail.com>

pkgname=papirus-icon-theme
pkgver=20170804
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
sha256sums=('e6599d20fd442529d59deb4a2fcfee3c569058c10a4950254b5fbb9aaa53e167')

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
