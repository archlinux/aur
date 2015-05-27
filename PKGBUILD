# Maintainer: Toke Høiland-Jørgensen <toke at toke dot dk>

pkgname=flent
pkgver=0.11.1
pkgrel=1
pkgdesc='The FLExible Network Tester.'
arch=('any')
url='https://github.com/tohojo/flent'
license=('GPL')
depends=('python' 'netperf' 'python-setuptools')
conflicts=('netperf-wrapper')
replaces=('netperf-wrapper')
optdepends=(
    'python-matplotlib: for outputting graphs'
    'python-pyqt4: for the GUI'
)
source=("https://pypi.python.org/packages/source/f/flent/flent-${pkgver}.tar.gz")
sha1sums=('1d374615b8409757db11a19b43a0d516ffd67ba8')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  python setup.py install --single-version-externally-managed --root="$pkgdir" --optimize=1
}
