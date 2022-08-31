# Maintainer: Tobias Bachmann <tobachmann@gmx.de>
pkgname=fsleyes-props
pkgver=1.8.2
pkgrel=1
pkgdesc="The fsleyes-props project is an event programming framework, which includes the ability for automatic CLI generation and, optionally, automatic GUI generation (if wxPython is present). It is used by FSLeyes."
arch=('any')
url="https://fsl.fmrib.ox.ac.uk/fsl/fslwiki/FSLeyes"
license=('Apache')
groups=()
depends=('python')
makedepends=('python-six' 'python-numpy' 'python-matplotlib' 'python-deprecation' 'python-wxpython>=4.0.1-2' 'fslpy>=3.1.0' 'fsleyes-widgets>=0.7.3')
optdepends=()
provides=()
conflicts=()
replaces=()
source=("https://git.fmrib.ox.ac.uk/fsl/fsleyes/${pkgname#fsleyes-}/-/archive/${pkgver}/${pkgname#fsleyes-}-${pkgver}.tar.gz")
sha256sums=('735d2af90d25aa1e7147e1d79efa9a9596ab2bfc48283509aef9e7b2c29f252b')

package() {
  cd "$srcdir/${pkgname#fsleyes-}-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
