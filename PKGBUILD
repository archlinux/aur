# Submitter: Nbiba Bedis <bedisnbiba@gmail.com>

pkgname=('traffictoll')
pkgver=0.1.0
pkgrel=6
pkgdesc='NetLimiter-like traffic shaping for Linux'
arch=('any')
url='https://github.com/cryzed/TrafficToll'
license=('GPL3')
depends=('python' 'python-ruamel-yaml' 'python-psutil' 'python-loguru')
makedepends=('python-setuptools')
source=("https://github.com/cryzed/TrafficToll/archive/master.zip")
sha256sums=('a6dd70864687265b562f17baaa78acffb6da552028156131c4ed03eded0e01c6')

package() {
  cd "TrafficToll-master"
  python setup.py install --root="$pkgdir/" --optimize=1
}