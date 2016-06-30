# Maintainer: Christopher Loen <christopherloen at gmail dot com>
pyname='app_version'
pkgbase="python-${pyname}"
pkgname=("python2-${pyname}" "python-${pyname}")
pkgver='0.2.1'
pkgrel=1
pkgdesc='A tiny utility to get application version from pkg_resouces'
arch=('any')
url='https://github.com/lambdalisue/app_version'
license=('MIT')
depends=('python' 'python-tolerance' 'python2-tolerance')
makedepends=('python2-pip' 'python-pip')
source=('https://pypi.python.org/packages/ac/a7/dedf1c4302ffcd271cdc788308bd0c4ae0c1b6e8aeef63295259213cfa3b/app_version-0.2.1.tar.gz')
md5sums=('fc09b5d2a8d7f35636dc0adfe0617b5a')


package_python2-app_version() {
	cd "${srcdir}/${pyname}-${pkgver}"
	echo :: Installing for Python2.7 ...
	pip2 install --prefix=/usr --isolated --root="${pkgdir}" --no-deps --ignore-installed .
}
package_python-app_version() {
    cd "${srcdir}/${pyname}-${pkgver}"
    echo :: Installing for Python3 ...
    pip3 install --prefix=/usr --isolated --root="${pkgdir}" --no-deps --ignore-installed .
}
