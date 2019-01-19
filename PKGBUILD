# Maintainer: Jonas 'cherti' Große Sundrup <aur@letopolis.de>

pkgname=blinky
pkgver=0.14
pkgrel=1
pkgdesc="AUR-helper with minimal hassle"
arch=(any)
url="https://github.com/cherti/blinky"
license=('GPLv3')
depends=('python' 'pyalpm' 'python-requests' 'python-termcolor' 'colordiff')
options=(!emptydirs)
source=('https://github.com/cherti/blinky/archive/v0.14.tar.gz')
sha256sums=('01fa764c25a4a17f1c4279d3d7dc2a8c2c5d2b233be0eddd8ba747be029e13ae')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
