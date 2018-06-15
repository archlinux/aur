# Maintainer: Jonas 'cherti' Große Sundrup <aur@letopolis.de>

pkgname=blinky
pkgver=0.2
pkgrel=1
pkgdesc="AUR-helper with minimal hassle"
arch=(any)
url="https://github.com/cherti/blinky"
license=('GPLv3')
#groups=()
depends=('python' 'pyalpm' 'python-requests' 'python-termcolor')
#makedepends=()
#provides=()
#conflicts=()
#replaces=()
#backup=()
options=(!emptydirs)
#install=
source=('https://github.com/cherti/blinky/archive/v0.2.tar.gz')
sha256sums=('e699b9164be3b886a6ff48dc834e6c25ecf31e5bc7599895159a06bcc6d66015')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
