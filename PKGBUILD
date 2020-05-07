# Maintainer: Jonas 'cherti' Große Sundrup <aur@letopolis.de>

pkgname=blinky
pkgver=0.20.1
pkgrel=1
pkgdesc="AUR-helper with minimal hassle"
arch=(any)
url="https://github.com/cherti/blinky"
license=('GPLv3')
depends=('python' 'pyalpm' 'python-requests' 'python-termcolor' 'python-pyxdg' 'colordiff')
options=(!emptydirs)
source=('https://github.com/cherti/blinky/archive/v0.20.1.tar.gz')
sha256sums=('d95e175c659ddbd8c71ef2167fef5a040708388cbaaf628c362621ecc44bd18b')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
