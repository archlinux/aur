# Maintainer: budRich
# Contributor: budRich

pkgname=xfce4-panel-i3-plugins
pkgver=2022.06.16.1
pkgrel=1
pkgdesc='Xfce4-panel plugins modified to work better with i3wm'
arch=('any')
url='https://github.com/budRich/xfce4-panel-i3-plugins'
license=('GPL2')
depends=('i3-wm' 'i3ass' 'xfce4-panel')
makedepends=('xfce4-panel' 'xfce4-dev-tools')
source=("$url/archive/$pkgver/${pkgname}-$pkgver.tar.gz")
sha256sums=('2f65cb7b995fa2556016fc99fb7e5fc651a3f5c77b75621b045adbaacb872684')

# sha256sums=('SKIP')
# url="file:///home/bud/git/bud/$pkgname"
# source=("${pkgname}-${pkgver}::git+$url")

package() {
  cd "$pkgname-$pkgver"

  make && make DESTDIR="$pkgdir/" PREFIX=/usr install
}
