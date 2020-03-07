# Maintainer: Jonas 'cherti' Große Sundrup <aur@letopolis.de>

pkgname=blinky
pkgver=0.19
pkgrel=1
pkgdesc="AUR-helper with minimal hassle"
arch=(any)
url="https://github.com/cherti/blinky"
license=('GPLv3')
depends=('python' 'pyalpm' 'python-requests' 'python-termcolor' 'colordiff')
options=(!emptydirs)
source=('https://github.com/cherti/blinky/archive/v0.19.tar.gz')
sha256sums=('cbc16d9708cb4457abb66e91f8c351d59a90b2b4e6b19e19b2aab85efc247c5e')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
