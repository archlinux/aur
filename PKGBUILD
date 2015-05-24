# Maintainer: Toke Høiland-Jørgensen <toke at toke dot dk>

pkgname=flent
pkgver=0.10.0
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
sha1sums=('6825e4b23e3607b2174b77af84fc5f701c4c7042')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  python setup.py install --fake-root --root="$pkgdir" --optimize=1
}
