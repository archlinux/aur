# Maintainer: Tobias Bachmann <tobachmann@gmx.de>
pkgname=fsleyes-widgets
pkgver=0.12.1
pkgrel=2
pkgdesc="FSLeyes is the FSL image viewer, widgets is one of its dependent projects"
arch=('any')
url="https://fsl.fmrib.ox.ac.uk/fsl/fslwiki/FSLeyes"
license=('Apache')
groups=()
depends=('python')
makedepends=('python-six' 'python-numpy' 'python-matplotlib' 'python-wxpython>=4.0.1-2' 'python-deprecation')
optdepends=()
provides=()
conflicts=()
replaces=()
source=("https://git.fmrib.ox.ac.uk/fsl/fsleyes/${pkgname#fsleyes-}/-/archive/${pkgver}/${pkgname#fsleyes-}-${pkgver}.tar.gz")
sha256sums=('3b97f5cdab9415b6cb3f2424a1e863f5576e86c886d6bf04cab2d26075ba38e4')

package() {
  cd "$srcdir/${pkgname#fsleyes-}-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
