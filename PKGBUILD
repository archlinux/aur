# Maintainer: Jonas 'cherti' Große Sundrup <aur@letopolis.de>

pkgname=blinky
pkgver=0.18
pkgrel=1
pkgdesc="AUR-helper with minimal hassle"
arch=(any)
url="https://github.com/cherti/blinky"
license=('GPLv3')
depends=('python' 'pyalpm' 'python-requests' 'python-termcolor' 'colordiff')
options=(!emptydirs)
source=('https://github.com/cherti/blinky/archive/v0.18.tar.gz')
sha256sums=('c1eaea3deb1da6eb3b72a02e742a0136bbf9e5983fe4ef157d18ac938ae65e17')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
