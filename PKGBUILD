# Maintainer: kitsunyan <kitsunyan@inbox.ru>
# Contributor: Grigorii Horos <horosgrisa@gmail.com>

pkgname=papirus-icon-theme
pkgver=20170921
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
sha256sums=('a45965c6b1d8f8d046ac458b9d462badfaac3a38076f1610350a990fa2bf5024')

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
