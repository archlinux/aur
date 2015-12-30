# Maintainer: Lukasz Pozarlik <lpozarlik@gmail.com>

pkgbase=python-hgapi
pkgname=('python-hgapi'
	 'python2-hgapi')
pkgdesc="Python API to Mercurial using the command-line interface."
pkgver=1.7.3
pkgrel=1
url="https://bitbucket.org/haard/hgapi"
license=('MIT')
arch=('any')
source="https://bitbucket.org/haard/hgapi/get/${pkgver}.tar.gz"
md5sums=('0d0aeb97d0c8b5cc724fc36dff84148d')

package_python-hgapi(){
	depends=('python')
	cd "${srcdir}/haard-hgapi-609c11e7cc7b"
	python setup.py install --root="${pkgdir}" --optimize=1
}

package_python2-hgapi(){
        depends=('python2')
        cd "${srcdir}/haard-hgapi-609c11e7cc7b"
        python2 setup.py install --root="${pkgdir}" --optimize=1
}

