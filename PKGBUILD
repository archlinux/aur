# Maintainer: Toke Høiland-Jørgensen <toke at toke dot dk>

pkgname=flent
pkgver=0.11.0
pkgrel=1
pkgdesc='The FLExible Network Tester.'
arch=('any')
url='https://github.com/tohojo/flent'
license=('GPL')
depends=('python' 'netperf')
conflicts=('netperf-wrapper')
replaces=('netperf-wrapper')
optdepends=(
    'python-matplotlib: for outputting graphs'
    'python-pyqt4: for the GUI'
)
source=("https://pypi.python.org/packages/source/f/flent/flent-${pkgver}.tar.gz")
sha1sums=('f1bc45a15b40004f20f9916c84f4a1bc3508f74e')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  python setup.py install --fake-root --root="$pkgdir" --optimize=1
}
