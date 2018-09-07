# Maintainer: Jonas 'cherti' Große Sundrup <aur@letopolis.de>

pkgname=blinky
pkgver=0.8
pkgrel=1
pkgdesc="AUR-helper with minimal hassle"
arch=(any)
url="https://github.com/cherti/blinky"
license=('GPLv3')
depends=('python' 'pyalpm' 'python-requests' 'python-termcolor')
options=(!emptydirs)
source=('https://github.com/cherti/blinky/archive/v0.8.tar.gz')
sha256sums=('635305cb697bec97c40dbeb432eb3391030f2aa88f0a681819f089caa7006321')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
