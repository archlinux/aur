# Maintainer: Jonas 'cherti' Große Sundrup <aur@letopolis.de>

pkgname=blinky
pkgver=0.10.1
pkgrel=1
pkgdesc="AUR-helper with minimal hassle"
arch=(any)
url="https://github.com/cherti/blinky"
license=('GPLv3')
depends=('python' 'pyalpm' 'python-requests' 'python-termcolor')
options=(!emptydirs)
source=('https://github.com/cherti/blinky/archive/v0.10.1.tar.gz')
sha256sums=('56e89b45fc16105fe4659b646b9527034176efbc41b690dc390486214526232f')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
