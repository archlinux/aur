# Maintainer: Danilo Bargen <aur at dbrgn dot ch>
pkgname=orochi
pkgver=0.2.0
pkgrel=1
pkgdesc="Orochi is a command line client for 8tracks.com."
arch=('any')
url="https://github.com/dbrgn/orochi"
license=('GPL')
groups=()
depends=('python')
makedepends=()
provides=('orochi')
conflicts=('orochi-git')
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/o/orochi/${pkgname}-${pkgver}.tar.gz")
md5sums=('f8f2edda13949dcb9b8987dc294a5739')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
