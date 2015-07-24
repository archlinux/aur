# Maintainer: Lukasz Pozarlik <lpozarlik@gmail.com>

pkgname=python2-airspeed
pkgdesc="Airspeed is a powerful and easy-to-use templating engine for Python that aims for a high level of compatibility with the popular Velocity library for Java."
pkgver="0.5.4"
pkgrel=1
url="https://pypi.python.org/pypi/jira"
license=('GPL')
arch=('any')
depends=('python') 
source="https://pypi.python.org/packages/source/a/airspeed/airspeed-0.5.4dev-20150515.tar.gz"
md5sums=('c49066864b16b169efda73d3b0583897')

package(){
	tar -zxvf airspeed-${pkgver}dev-20150515.tar.gz
	cd airspeed-${pkgver}dev-20150515
	python setup.py install --root="${pkgdir}" --optimize=1
}

