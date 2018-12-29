# Maintainer: Jonas 'cherti' Große Sundrup <aur@letopolis.de>

pkgname=blinky
pkgver=0.12
pkgrel=1
pkgdesc="AUR-helper with minimal hassle"
arch=(any)
url="https://github.com/cherti/blinky"
license=('GPLv3')
depends=('python' 'pyalpm' 'python-requests' 'python-termcolor' 'colordiff')
options=(!emptydirs)
source=('https://github.com/cherti/blinky/archive/v0.12.tar.gz')
sha256sums=('4010887c07491515c1e0cb412783d8222e0437e1e6a6003c8474607d0a156a73')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
