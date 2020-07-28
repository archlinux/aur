# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=scrotpush
pkgver=1.3
pkgrel=1
pkgdesc="Push screenshot to imgur and copy its url"
arch=('any')
url="https://gitlab.com/WhyNotHugo/scrotpush"
license=('BSD')
depends=('python-requests' 'python-xdg' 'python-gobject' 'libnotify' 'xclip')
source=("https://gitlab.com/WhyNotHugo/$pkgname/repository/archive.tar.gz?ref=v$pkgver")
md5sums=('e568b97df20f48856243dc7b99f1046a')

package() {
  cd "$srcdir/$pkgname-v$pkgver-"*

  make DESTDIR="${pkgdir}" install
}
