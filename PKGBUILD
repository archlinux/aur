# Maintainer: Jonas 'cherti' Große Sundrup <aur@letopolis.de>

pkgname=blinky
pkgver=0.7
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
source=('https://github.com/cherti/blinky/archive/v0.7.tar.gz')
sha256sums=('167c14acdbf9791a14ead350aeca7db5fbf88b6af7c465cbe6637b4969fde485')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
