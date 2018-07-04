# Maintainer: Jonas 'cherti' Große Sundrup <aur@letopolis.de>

pkgname=blinky
pkgver=0.3
pkgrel=1
pkgdesc="AUR-helper with minimal hassle"
arch=(any)
url="https://github.com/cherti/blinky"
license=('GPLv3')
#groups=()
depends=('python' 'pyalpm' 'python-requests' 'python-termcolor')
#makedepends=()
#provides=()
#conflicts=()
#replaces=()
#backup=()
options=(!emptydirs)
#install=
source=('https://github.com/cherti/blinky/archive/v0.3.tar.gz')
sha256sums=('196d2732367542c46d04d54be140f06f6e51ab3bc33dca5f7cc9dbb5949500c2')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
