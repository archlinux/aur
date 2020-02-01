# Submitter: Nbiba Bedis <bedisnbiba@gmail.com>

pkgname=traffictoll
_pkgname=TrafficToll
pkgver=1.3.1
pkgrel=1
pkgdesc='NetLimiter-like traffic shaping for Linux'
arch=('any')
url='https://github.com/cryzed/TrafficToll'
license=('GPL3')
depends=('python' 'python-ruamel-yaml' 'python-psutil' 'python-loguru')
makedepends=('python-setuptools')
provides=('tt')
conflicts=('tt')
source=('https://github.com/cryzed/TrafficToll/releases/download/v1.3.1/TrafficToll-1.3.1.tar.gz')
md5sums=('c72dedf13588219ef81207546a3a2b8d')

package() {
  cd ${_pkgname}
  python setup.py install --root="${pkgdir}" --optimize='1'
}