# Maintainer: Jonas 'cherti' Große Sundrup <aur@letopolis.de>

pkgname=blinky
pkgver=0.9.1
pkgrel=1
pkgdesc="AUR-helper with minimal hassle"
arch=(any)
url="https://github.com/cherti/blinky"
license=('GPLv3')
depends=('python' 'pyalpm' 'python-requests' 'python-termcolor')
options=(!emptydirs)
source=('https://github.com/cherti/blinky/archive/v0.9.1.tar.gz')
sha256sums=('4ec9344f38afc969f2e551541cd01ae17e88efc9a9e5da18c08eed0e50cdcb63')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
