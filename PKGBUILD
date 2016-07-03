# Maintainer: Lukasz Pozarlik <lpozarlik@gmail.com>

pkgbase=python-workalendar
pkgname=('python-workalendar'
	 'python2-workalendar')
pkgdesc="Worldwide holidays and working days helper and toolkit"
pkgver=0.6.1
pkgrel=1
url="https://github.com/novafloss/workalendar"
license=('MIT')
arch=('any')
source=("https://github.com/novafloss/workalendar/archive/${pkgver}.tar.gz")
md5sums=('52660bac664924c82464407e4cce6202')
makedepends=('python'
             'python-lunardate'
             'python-pycalverter'
             'python-pytz'
             'python-dateutil'
             'python-pyephem'
             'python2-pyephem')


package_python-workalendar(){
	depends=('python-lunardate'
		 'python-pycalverter'
                 'python-pytz'
                 'python-dateutil'
                 'python-pyephem')
        makedepends=('python'
                     'python-lunardate'
                     'python-pycalverter'
                     'python-pytz'
                     'python-dateutil'
                     'python-pyephem')

        cd "$srcdir/workalendar-${pkgver}"
	python setup.py install --root="${pkgdir}/" --optimize=1
}


package_python2-workalendar(){
	depends=('python2-lunardate'
	         'python2-pycalverter'
                 'python2-pytz'
                 'python2-dateutil'
                 'python2-pyephem')
        makedepends=('python2'
                     'python2-lunardate'
                     'python2-pycalverter'
                     'python2-pytz'
                     'python2-dateutil'
                     'python2-pyephem')

        cd "$srcdir/workalendar-${pkgver}"
        python2 setup.py install --root="${pkgdir}/" --optimize=1
}
