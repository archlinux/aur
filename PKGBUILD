# Maintainer: Tobias Bachmann <tobachmann@gmx.de>
pkgname=fsleyes-props
pkgver=1.7.3
pkgrel=2
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
sha256sums=('b798deda298a47d32d3585c1743001c36df3ea18a491b2f7c6de257e8dc4774d')

package() {
  cd "$srcdir/${pkgname#fsleyes-}-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
