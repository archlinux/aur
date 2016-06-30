# Maintainer: Christopher Loen <christopherloen at gmail dot com>
pyname='tolerance'
pkgbase="python-${pyname}"
pkgname=("python2-${pyname}" "python-${pyname}")
pkgver='0.1.2'
pkgrel=1
pkgdesc='A function decorator which makes a function tolerant'
arch=('any')
url='https://github.com/lambdalisue/tolerance'
license=('MIT')
depends=('python')
makedepends=('python2-pip' 'python-pip')
source=('https://pypi.python.org/packages/68/19/e49b2915d182f9967bb6950faad6935ece45566356a3bf50e8f5c73ab4d7/tolerance-0.1.2.tar.gz')
md5sums=('b092c809d6c9b31c32d84411597c8d93')


package_python2-tolerance() {
	cd "${srcdir}/${pyname}-${pkgver}"
	echo :: Installing for Python2.7 ...
	pip2 install --prefix=/usr --isolated --root="${pkgdir}" --no-deps --ignore-installed .
}
package_python-tolerance() {
    cd "${srcdir}/${pyname}-${pkgver}"
    echo :: Installing for Python3 ...
    pip3 install --prefix=/usr --isolated --root="${pkgdir}" --no-deps --ignore-installed .
}
