# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=scrotpush
pkgver=1.3
pkgrel=1
pkgdesc="Push screenshot to imgur and copy its url"
arch=('any')
url="https://github.com/hobarrera/scrotpush"
license=('BSD')
depends=('python-requests' 'python-xdg' 'python-gobject' 'libnotify' 'xclip')
source=("https://github.com/hobarrera/${pkgname}/archive/v${pkgver}.zip")
md5sums=('eb19477146743f2d6bc9341822c9e5fa')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="${pkgdir}" install
}
