pkgname=plover
pkgver=2.5.8
pkgrel=1
pkgdesc="Free and open source real-time stenography engine."
arch=(any)
url="https://www.openstenoproject.org"
license=('GPLv2')
groups=()
depends=('python2' 'python2-setuptools' 'wxpython' 'python2-xlib' 'wmctrl'
	'python2-simplejson' 'python2-pyserial' 'python2-appdirs')
makedepends=()
provides=('plover')
conflicts=('plover-git')
backup=()
options=()
source=("https://github.com/openstenoproject/plover/archive/v$pkgver.tar.gz")
md5sums=('07baf37d3bd9b888ffe54fd598b93e10')

package() {
	cd plover-$pkgver
	python2 setup.py install --root="$pkgdir"
}
