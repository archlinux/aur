# Maintainer: Tobias Bachmann <tobachmann@gmx.de>
pkgname=fslpy
pkgver=2.3.0
pkgrel=1
pkgdesc="The fslpy package is a collection of utilities and data abstractions used by FSLeyes."
arch=('any')
url="https://fsl.fmrib.ox.ac.uk/fsl/fslwiki/FSLeyes"
license=('Apache')
groups=()
depends=('python' 'python-six' 'python-numpy' 'python-scipy' 'python-nibabel')
makedepends=('python-setuptools')
optdepends=()
provides=()
conflicts=()
replaces=()
source=($pkgname-$pkgver.tar.gz::https://git.fmrib.ox.ac.uk/fsl/fslpy/repository/archive.tar.gz?ref=$pkgver)
sha256sums=('79dcc09d02ff841639dda0e86a42389347712466e3b52ddafd5e6bede1f1548e')

package() {
  cd "$srcdir/${pkgname#fsleyes-}-$pkgver-"*
  python setup.py install --root="$pkgdir/" --optimize=1
}
