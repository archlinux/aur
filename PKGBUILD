# Maintainer: Jonas 'cherti' Große Sundrup <aur@letopolis.de>

pkgname=blinky
pkgver=0.1
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
source=('https://github.com/cherti/blinky/archive/v0.1.tar.gz')
sha256sums=('d784101f95b511331cf4816fb88e084065634b9faa2c4b1696e5c19a43da561a')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
