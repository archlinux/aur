# Maintainer: Jon Gjengset <jon@thesquareplanet.com>
pkgname=cpuset
pkgver=1.5.7
pkgrel=1
pkgdesc="Cpuset is a Python application to make using the cpusets facilities in the Linux kernel easier."
arch=('any')
url="https://code.google.com/p/cpuset/"
license=('GPL2')
depends=('python2')
options=('!emptydirs')
source=("https://github.com/lpechacek/cpuset/archive/v${pkgver}.tar.gz")
md5sums=('6ad79b26ba03f559604d74513cc34392')

package() {
	cd "$srcdir/$pkgname-$pkgver"
	python2 setup.py install --root="$pkgdir/" --optimize=1
}
