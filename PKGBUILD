# Maintainer: Danilo Bargen <aur at dbrgn dot ch>
pkgname=orochi
pkgver=0.1.3
pkgrel=2
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
source=("https://github.com/dbrgn/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('dee092daaf7049b6aff887d9789c2c879c98fa13842c88f151aa5cd5a0a682ef')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
