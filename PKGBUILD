# Maintainer: Christopher Loen <christopherloen at gmail dot com>
pyname='parsel'
pkgbase='python-parsel'
pkgname=('python-parsel' 'python2-parsel')
pkgver='1.0.2'
pkgrel=1
pkgdesc='A library to extract data from HTML and XML using XPath and CSS selectors'
arch=('any')
url='https://github.com/scrapy/parsel'
license=('BSD')
makedepends=('python2-pip' 'python-pip')
source=('https://pypi.python.org/packages/a8/32/d73ffeb16e47f6c9a6eb610624eb5f42ca9ac9ce298d30e0aef80f2055d2/parsel-1.0.2.tar.gz')
md5sums=('5f85137075031832cf9c419f7cacc27c')


package_python-parsel() {
	
	depends=('python' 'python-lxml' 'python-w3lib' 'python-cssselect' 'python-six')
        cd "${srcdir}/${pyname}-${pkgver}"
        echo :: Installing for python3 ...
        pip3 install --prefix=/usr --isolated --root="${pkgdir}" --no-deps --ignore-installed .
}

package_python2-parsel() {
    depends=('python2' 'python2-lxml' 'python2-w3lib' 'python2-cssselect' 'python2-six')
        cd "${srcdir}/${pyname}-${pkgver}"
        echo :: Installing for python 2.7 ...
        pip2 install --prefix=/usr --isolated --root="${pkgdir}" --no-deps --ignore-installed .
}
