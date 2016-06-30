# Maintainer: Christopher Loen <christopherloen at gmail dot com>
pyname='django-simple-permissions'
pkgbase='python-django-simple-permissions'
pkgname=('python2-django-simple-permissions' 'python-django-simple-permissions')
pkgver='0.2.1'
pkgrel=1
pkgdesc=''
arch=('any')
url=''
license=('GPL')
depends=('python' 'python2-django' 'python-django')
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
