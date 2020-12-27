# Maintainer: TheCynicalTeam <TheCynicalTeam@github.com>
# Contributor: TheCynicalTeam <TheCynicalTeam@github.com>
pkgname=instamenu-extra 
pkgver=2020.12.27
pkgrel=1
pkgdesc="addons for instamenu"
url="https://github.com/TheCynicalTeam/$pkgname"
arch=('any')
license=('GNU General Public License v3.0')
depends=(instamenu)
provides=($pkgname)
source=("${pkgname}-$pkgver-$pkgrel.tar.gz::${url}/archive/$pkgver-$pkgrel.tar.gz")
sha256sums=('2c11e27f6a96ca98bd1b3c8171d01bc9eab0c6c3bac6014bb48e8f627c50cc53')

package() {
  cd "$srcdir/$pkgname-$pkgver-$pkgrel"
  install -Dm 755 instamenu_settings "$pkgdir/usr/bin/instamenu_settings"
  install -Dm 755 instamenu_pacman "$pkgdir/usr/bin/instamenu_pacman"
}