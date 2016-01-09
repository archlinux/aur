# Maintainer: Michael Heyns  <mike.bean.heyns at gmail dot com>
pkgname=display-visor
pkgver=0.4
pkgrel=1
pkgdesc="An xrandr wrapper daemon for automatically configuring displays upon system events."
arch=(any)
url="https://github.com/beanaroo/display-visor"
license=('GPL3')
depends=('xorg-xrandr')
optdepends=('acpid: for included lid events' )
install='install'
source=(https://github.com/beanaroo/display-visor/archive/v${pkgver}.tar.gz)
md5sums=('9fb75b1cf815cc006907c646d03b97a9')

package() {
  cd "$pkgname-$pkgver"

  make PREFIX=/usr DESTDIR="$pkgdir" install
}
