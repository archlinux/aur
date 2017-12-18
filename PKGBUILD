# Maintainer: Clint Valentine <valentine.clint@gmail.com>

pkgname='python-spectra'
pkgver=0.0.6
pkgrel=1
pkgdesc="Color scales and color conversion in Python"
arch=('any')
url="https://github.com/jsvine/spectra"
license=('MIT')
depends=('python' 'python-networkx>=1.11' 'python-colormath>=2.1.1')
makedepends=('python-setuptools')
provides=('python-spectra')
conflicts=('python-spectra')
options=(!emptydirs)
source=("https://github.com/jsvine/spectra/archive/v${pkgver}.tar.gz")
md5sums=('dda5cc9d0035d7b689c6d01485f7b9fd')

package() {
  cd "${srcdir}/spectra-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}
