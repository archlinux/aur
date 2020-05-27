# Maintainer: Jonas 'cherti' Große Sundrup <aur@letopolis.de>

pkgname=blinky
pkgver=0.21
pkgrel=1
pkgdesc="AUR-helper with minimal hassle"
arch=(any)
url="https://github.com/cherti/blinky"
license=('GPLv3')
depends=('python' 'pyalpm' 'python-requests' 'python-termcolor' 'python-pyxdg' 'colordiff')
options=(!emptydirs)
source=('https://github.com/cherti/blinky/archive/v0.21.tar.gz')
sha256sums=('b8a0648b108c3938c36069a9bc75ce76cb6720c6dcc7acff7ae8edf82f030d66')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
