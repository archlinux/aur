# Submitter: Nbiba Bedis <bedisnbiba@gmail.com>

pkgname=('traffictoll')
pkgver=0.1.1
pkgrel=2
pkgdesc='NetLimiter-like traffic shaping for Linux'
arch=('any')
url='https://github.com/cryzed/TrafficToll'
license=('GPL3')
depends=('python' 'python-ruamel-yaml' 'python-psutil' 'python-loguru')
makedepends=('python-setuptools')
source=("https://github.com/cryzed/TrafficToll/archive/master.zip")
md5sums=('e9498ddf3c3e11cb81ed6d49131ba57b')

package() {
  cd "TrafficToll-master"
  python setup.py install --root="$pkgdir/" --optimize=1
}