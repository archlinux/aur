# Maintainer: Toke Høiland-Jørgensen <toke at toke dot dk>

pkgname=flent
pkgver=0.12.0
pkgrel=1
pkgdesc='The FLExible Network Tester.'
arch=('any')
url='https://flent.org'
license=('GPL')
depends=('python' 'netperf' 'python-setuptools')
conflicts=('netperf-wrapper')
replaces=('netperf-wrapper')
optdepends=(
    'python-matplotlib: for outputting graphs'
    'python-pyqt4: for the GUI'
)
source=("https://pypi.python.org/packages/source/f/flent/flent-${pkgver}.tar.gz")
sha1sums=('145bec60812d159ecde9cec7a319ebdb247c3c4d')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  python setup.py install --single-version-externally-managed --root="$pkgdir" --optimize=1
}
