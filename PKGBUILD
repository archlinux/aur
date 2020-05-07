# Maintainer: Jonas 'cherti' Große Sundrup <aur@letopolis.de>

pkgname=blinky
pkgver=0.20.1
pkgrel=2
pkgdesc="AUR-helper with minimal hassle"
arch=(any)
url="https://github.com/cherti/blinky"
license=('GPLv3')
depends=('python' 'pyalpm' 'python-requests' 'python-termcolor' 'python-pyxdg' 'colordiff')
options=(!emptydirs)
source=('https://github.com/cherti/blinky/archive/v0.20.1.tar.gz')
sha256sums=('68f4a41d5a74257423ce0d6d3be9ec009ff07aa865ea9f758fc9163216933e19')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
