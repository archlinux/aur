# Submitter: Nbiba Bedis <bedisnbiba@gmail.com>

pkgname=traffictoll
_pkgname=TrafficToll
pkgver=0.1.1
pkgrel=4
pkgdesc='NetLimiter-like traffic shaping for Linux'
arch=('any')
url='https://github.com/cryzed/TrafficToll'
license=('GPL3')
depends=('python' 'python-ruamel-yaml' 'python-psutil' 'python-loguru')
makedepends=('python-setuptools')
provides=('tt')
conflicts=('tt')
source=('git+https://github.com/cryzed/TrafficToll.git')
md5sums=('SKIP')

package() {
  cd ${_pkgname}
  python setup.py install --root="${pkgdir}" --optimize='1'
}