# Maintainer: Lukasz Pozarlik <lpozarlik@gmail.com>

pkgname=python-jira
pkgdesc="Python library for interacting with JIRA via REST APIs."
pkgver=1.0.3
pkgrel=1
url="https://pypi.python.org/pypi/jira"
license=('GPL')
arch=('any')
depends=('python') 
makedepends=('python-pip')
source="https://pypi.python.org/packages/2.7/j/jira/jira-1.0.3-py2.py3-none-any.whl"
md5sums=('a4eb7a250cd8fc2adb00e2245a68a528')

package(){
	pip install --no-deps --target $pkgdir/usr/lib/python2.7/site-packages jira-1.0.3-py2.py3-none-any.whl
}

