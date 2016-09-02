# Maintainer: Danilo Bargen <aur at dbrgn dot ch>
pkgname=orochi
pkgver=0.2.1
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
source=('https://pypi.python.org/packages/b7/16/c0b9ba75b52921985888765a7d0fa669267fe55221786620c1ba93ac9c24/orochi-0.2.1.tar.gz')
md5sums=('9d7b6662d294ace93fc32c25a8da2a5a')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
