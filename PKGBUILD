# Maintainer: TheCynicalTeam <TheCynicalTeam@github.com>
# Contributor: TheCynicalTeam <TheCynicalTeam@github.com>
pkgname=i3-swallow
pkgver=2020.6.27
pkgrel=1
pkgdesc="Swallow a terminal window after a blocking application is run in i3"
arch=('any')
url="https://github.com/TheCynicalTeam/i3-swallow"
license=('GNU General Public License v3.0')
depends=('xdo')
makedepends=('git')
conflicts=('i3-swallow-git')
changelog=
source=("https://github.com/TheCynicalTeam/$pkgname/archive/$pkgver-$pkgrel.tar.gz")
sha256sums=('fbe01e0dcf58efb3bfff0c438c6dfc1644c881f0418dd0516b6af9011361b414')

package() {
  cd "$srcdir/$pkgname-$pkgver-$pkgrel"
  install -Dm 755 swallow "$pkgdir/usr/bin/i3-swallow"
  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
