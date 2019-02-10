# Submitter: Nbiba Bedis <bedisnbiba@gmail.com>

pkgname=('traffictoll')
pkgver=0.1.0
pkgrel=2
pkgdesc='NetLimiter-like traffic shaping for Linux'
arch=('any')
url='https://github.com/cryzed/TrafficToll'
license=('GPL3')
depends=('python' 'python-ruamel-yaml' 'python-psutil' 'python-loguru')
makedepends=('python-setuptools')
source=("https://github.com/cryzed/TrafficToll/archive/master.zip")
md5sums=('dc4a3b226cfdc4b86599859653446151')

package() {
  cd "TrafficToll-master"
  python setup.py install --root="$pkgdir/" --optimize=1
}