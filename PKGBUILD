# Maintainer: Jonas 'cherti' Große Sundrup <aur@letopolis.de>

pkgname=blinky
pkgver=0.9
pkgrel=1
pkgdesc="AUR-helper with minimal hassle"
arch=(any)
url="https://github.com/cherti/blinky"
license=('GPLv3')
depends=('python' 'pyalpm' 'python-requests' 'python-termcolor')
options=(!emptydirs)
source=('https://github.com/cherti/blinky/archive/v0.9.tar.gz')
sha256sums=('67b708d5904d762ff0688bf0ddaac2ee0caa136577e2ac08d75113109d30e91c')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
