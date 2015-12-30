# Maintainer: Lukasz Pozarlik <lpozarlik@gmail.com>

pkgbase=python-hgapi
pkgname=('python-hgapi'
	 'python2-hgapi')
pkgdesc="Python API to Mercurial using the command-line interface."
pkgver=1.7.2
pkgrel=2
url="https://bitbucket.org/haard/hgapi"
license=('MIT')
arch=('any')
source="https://pypi.python.org/packages/source/h/hgapi/hgapi-${pkgver}.tar.gz"
md5sums=('7ccb6b331b3bb736a5726fdb92d12abd')

package_python-hgapi(){
	depends=('python')
	cd "${srcdir}/hgapi-${pkgver}"
	python setup.py install --root="${pkgdir}" --optimize=1
}

package_python2-hgapi(){
        depends=('python2')
        cd "${srcdir}/hgapi-${pkgver}"
        python2 setup.py install --root="${pkgdir}" --optimize=1
}

