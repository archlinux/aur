# Maintainer: Lukasz Pozarlik <lpozarlik@gmail.com>

pkgbase=python-airspeed
pkgname=('python-airspeed'
	 'python2-airspeed')
pkgdesc="Airspeed is a powerful and easy-to-use templating engine for Python that aims for a high level of compatibility with the popular Velocity library for Java"
pkgver="0.5.5"
pkgrel=1
url="https://pypi.python.org/pypi/airspeed/"
license=('BSD')
arch=('any')

source=("https://pypi.python.org/packages/fb/76/7133214b2151c9c43c0b1cf3ba5e3d0fd80b1fab1fae334f0160b70e8623/airspeed-${pkgver}.dev20160812.tar.gz")
md5sums=('c12f12f9e5e618eda7ec571c8e42e555')

package_python-airspeed(){
        depends=('python'
                 'python-six')
        cd "$srcdir/airspeed-${pkgver}.dev20160812"
        python setup.py install --root="${pkgdir}/" --optimize=1
}

package_python2-airspeed(){
        depends=('python2'
	         'python2-six')
	cd "$srcdir/airspeed-${pkgver}.dev20160812"
	python2 setup.py install --root="${pkgdir}/" --optimize=1
}

