# Maintainer: Jonas 'cherti' Große Sundrup <aur@letopolis.de>

pkgname=blinky
pkgver=0.20
pkgrel=1
pkgdesc="AUR-helper with minimal hassle"
arch=(any)
url="https://github.com/cherti/blinky"
license=('GPLv3')
depends=('python' 'pyalpm' 'python-requests' 'python-termcolor' 'python-pyxdg' 'colordiff')
options=(!emptydirs)
source=('https://github.com/cherti/blinky/archive/v0.20.tar.gz')
sha256sums=('835a4d3175574f7262ffb843431c436777ca8644dc46391c9df520bca365b58d')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
