# Maintainer: Jon Gjengset <jon@thesquareplanet.com>, Saren Arterius <saren@wtako.net>
pkgname=cpuset
pkgver=1.6
pkgrel=1
pkgdesc="Cpuset is a Python application to make using the cpusets facilities in the Linux kernel easier."
arch=('any')
url="https://github.com/lpechacek/cpuset/"
license=('GPL2')
depends=('python2' 'python2-future' 'python2-configparser')
options=('!emptydirs')
source=("https://github.com/lpechacek/cpuset/archive/v${pkgver}.tar.gz")
md5sums=('365dcccfef9ac095530821a7e711b308')

package() {
	cd "$srcdir/$pkgname-$pkgver"
	python2 setup.py install --root="$pkgdir/" --optimize=1
}
