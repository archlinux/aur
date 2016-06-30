# Maintainer: Christopher Loen <christopherloen at gmail dot com>
pyname='django-simple-permissions'
pkgbase="python-${pyname}"
pkgname=("python2-${pyname}" "python-${pyname}")
pkgver='0.2.1'
pkgrel=1
pkgdesc='A enhanced permission system which enable logical permissionsystems to complex permissions'
arch=('any')
url='https://github.com/lambdalisue/django-permission/'
license=('MIT')
depends=('python' 'python2-django' 'python-django' 'python-django-appconf' 'python2-django-appconf' 'python-app_version' 'python2-app_version')
makedepends=('python2-pip' 'python-pip')
source=('https://pypi.python.org/packages/fe/82/d1a9f4e1559c95cfc480b98d48784b7d556d11aa697fb2f1228eaa19fd18/django-simple-permissions-0.2.1.tar.gz')
md5sums=('4739e4c0ed669b51199d13075f27ac5a')


package_python2-django-simple-permissions() {
	cd "${srcdir}/${pyname}-${pkgver}"
	echo :: Installing for Python2.7 ...
	pip2 install --prefix=/usr --isolated --root="${pkgdir}" --no-deps --ignore-installed .
}
package_python-django-simple-permissions() {
    cd "${srcdir}/${pyname}-${pkgver}"
    echo :: Installing for Python3.5 ...
    pip3 install --prefix=/usr --isolated --root="${pkgdir}" --no-deps --ignore-installed .
}
