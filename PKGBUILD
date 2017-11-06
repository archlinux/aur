# Maintainer: Tobias Bachmann <tobachmann@gmx.de>
pkgname=python-xnatpy
pkgver=0.3.3
pkgrel=3
pkgdesc="A new XNAT client that exposes XNAT objects/functions as python objects/functions."
arch=('any')
_name=xnat
url="https://bitbucket.org/bigr_erasmusmc/xnatpy"
license=('Apache')
groups=()
depends=('python' 'python-isodate' 'python-progressbar' 'python-six' 'python-requests')
makedepends=()
provides=()
conflicts=()
replaces=('xnatpy')
backup=()
options=(!emptydirs)
install=
source=("https://bitbucket.org/bigr_erasmusmc/xnatpy/get/${pkgver}.tar.bz2")
sha256sums=('b925f18a69c9c60fbb24d3c7c628b0feda9a8d0e552b9195a3d6cd276bf24416')

package() {
  cd "$srcdir"/bigr_erasmusmc-xnatpy-*
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
