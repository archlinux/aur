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
makedepends=('git')
provides=($pkgname)
source=("${pkgname}-$pkgver-$pkgrel.tar.gz::${url}/archive/$pkgver-$pkgrel.tar.gz")
sha256sums=('SKIP')


package() {
  cd "$srcdir/$pkgname-$pkgver-$pkgrel"
  install -Dm 755 instamenu_settings "$pkgdir/usr/bin/instamenu_settings"
  install -Dm 755 instamenu_pacman "$pkgdir/usr/bin/instamenu_pacman"
}
