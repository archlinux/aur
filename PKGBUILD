# Maintainer: Lukasz Pozarlik <lpozarlik@gmail.com>

pkgbase=python-airspeed
pkgname=('python-airspeed')
	 #'python-airspeed')
pkgdesc="Airspeed is a powerful and easy-to-use templating engine for Python that aims for a high level of compatibility with the popular Velocity library for Java"
pkgver="0.5.4"
pkgrel=3
url="https://pypi.python.org/pypi/airspeed/"
license=('BSD')
arch=('any')
source="https://pypi.python.org/packages/source/a/airspeed/airspeed-${pkgver}dev-20150515.tar.gz"
md5sums=('c49066864b16b169efda73d3b0583897')

#package_python2-airspeed(){
#	depends=('python2'
#	         'python2-six')
#        cd "$srcdir/airspeed-${pkgver}dev-20150515"
#	python2 setup.py install --root="${pkgdir}/" --optimize=1
#}

package_python-airspeed(){
        depends=('python'
                 'python-six')
        cd "$srcdir/airspeed-${pkgver}dev-20150515"
        python setup.py install --root="${pkgdir}/" --optimize=1
}


