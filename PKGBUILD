# Maintainer: budRich
# Contributor: budRich

pkgname=xfce4-panel-i3-plugins
pkgver=2022.03.31.1
pkgrel=1
pkgdesc='Xfce4-panel plugins modified to work better with i3wm'
arch=('any')
url='https://github.com/budRich/xfce4-panel-i3-plugins'
license=('GPL2')
depends=('i3-wm' 'i3ass' 'xfce4-panel')
makedepends=('xfce4-panel' 'xfce4-dev-tools')
source=("$url/archive/$pkgver/${pkgname}-$pkgver.tar.gz")
sha256sums=('a93e6785eee59aa2f53b9d1a86716cd60b297b964b947f84840c054e2ca64958')

package() {
  cd "$pkgname-$pkgver"

  make && make DESTDIR="$pkgdir/" PREFIX=/usr install
}
