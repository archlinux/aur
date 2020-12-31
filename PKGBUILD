# Maintainer: TheCynicalTeam <TheCynicalTeam@github.com>
# Contributor: TheCynicalTeam <TheCynicalTeam@github.com>
pkgname=i3-swallow
pkgver=2020.12.31
pkgrel=1
pkgdesc="Swallow a terminal window after a blocking application is run in i3"
arch=('any')
url="https://github.com/TheCynicalTeam/i3-swallow"
license=('GPL3')
depends=('xdo')
makedepends=('git')
conflicts=('i3-swallow-git')
changelog=
source=("${pkgname}-$pkgver.tar.gz::${url}/archive/$pkgver.tar.gz")
sha256sums=('77ff2111fbeabc803e3aa00282030ea91da0c2f090c36af62217e5a35335d118')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm 755 swallow "$pkgdir/usr/bin/i3-swallow"
  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
