# Maintainer: budRich
# Contributor: budRich

pkgname=xfce4-panel-i3-plugins
pkgver=2022.06.23.1
pkgrel=1
pkgdesc='Xfce4-panel plugins modified to work better with i3wm'
arch=('any')
url='https://github.com/budRich/xfce4-panel-i3-plugins'
license=('GPL2')
depends=('i3-wm' 'i3ass' 'xfce4-panel')
makedepends=('xfce4-panel' 'xfce4-dev-tools')
source=("$url/archive/$pkgver/${pkgname}-$pkgver.tar.gz")
sha256sums=('6d2f050f554c1cae38ab53c64aa519d14977a775df3369a44caa9cbcff848fa0')

# sha256sums=('SKIP')
# url="file:///home/bud/git/bud/$pkgname"
# source=("${pkgname}-${pkgver}::git+$url")

package() {
  cd "$pkgname-$pkgver"

  make && make DESTDIR="$pkgdir/" PREFIX=/usr install
}
