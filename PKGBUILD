# Maintainer: budRich
# Contributor: budRich

pkgname=xfce4-panel-i3-plugins
pkgver=2022.06.16.2
pkgrel=1
pkgdesc='Xfce4-panel plugins modified to work better with i3wm'
arch=('any')
url='https://github.com/budRich/xfce4-panel-i3-plugins'
license=('GPL2')
depends=('i3-wm' 'i3ass' 'xfce4-panel')
makedepends=('xfce4-panel' 'xfce4-dev-tools')
source=("$url/archive/$pkgver/${pkgname}-$pkgver.tar.gz")
sha256sums=('6c80a13cdfbc5f07341b7d3999ccdbbbb72e8980ead14b4f97b447ec99c4fb91')

# sha256sums=('SKIP')
# url="file:///home/bud/git/bud/$pkgname"
# source=("${pkgname}-${pkgver}::git+$url")

package() {
  cd "$pkgname-$pkgver"

  make && make DESTDIR="$pkgdir/" PREFIX=/usr install
}
