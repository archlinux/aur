# Maintainer: TheCynicalTeam <TheCynicalTeam@github.com>
# Contributor: TheCynicalTeam <TheCynicalTeam@github.com>
pkgname=i3-swallow
pkgver=2021.01.01
pkgrel=1
pkgdesc="Swallow a terminal window after a blocking application is run in i3"
arch=('any')
url="https://github.com/TheCynicalTeam/i3-swallow"
license=('CC BY-NC-SA 4.0')
depends=('xdo' 'python-i3ipc')
makedepends=('git')
conflicts=('i3-swallow-git')
changelog=
source=("${pkgname}-$pkgver.tar.gz::${url}/archive/$pkgver.tar.gz")
sha256sums=('ab06d29b0889a7cbe1b1cf601da84b64ce3b7a8f51d03b9fc3b49f2e71a73aea')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm 755 swallow "$pkgdir/usr/bin/i3-swallow"
  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
