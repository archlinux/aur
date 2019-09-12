# Maintainer: Tobias Bachmann <tobachmann@gmx.de>
pkgname=fslpy
pkgver=2.6.0
pkgrel=1
pkgdesc="The fslpy package is a collection of utilities and data abstractions used by FSLeyes."
arch=('any')
url="https://fsl.fmrib.ox.ac.uk/fsl/fslwiki/FSLeyes"
license=('Apache')
groups=()
depends=('python' 'python-six' 'python-numpy' 'python-scipy' 'python-nibabel' 'python-h5py')
makedepends=('python-setuptools')
optdepends=()
provides=()
conflicts=()
replaces=()
source=($pkgname-$pkgver.tar.gz::https://git.fmrib.ox.ac.uk/fsl/fslpy/repository/archive.tar.gz?ref=$pkgver)
sha256sums=('8ed1d573cbac299d85d688d28060d4229eab7cde795cd4c719aea351404b7964')

package() {
  cd "$srcdir/${pkgname#fsleyes-}-$pkgver-"*
  python setup.py install --root="$pkgdir/" --optimize=1
}
