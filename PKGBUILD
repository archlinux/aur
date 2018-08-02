# Maintainer: Jonas 'cherti' Große Sundrup <aur@letopolis.de>

pkgname=blinky
pkgver=0.6
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
source=('https://github.com/cherti/blinky/archive/v0.6.tar.gz')
sha256sums=('13f33260c54cba16d479c09912bf6e82089f0e8ec7a15877c9e78b4f07e43699')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
