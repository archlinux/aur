# Maintainer: Christopher Loen <christopherloen at gmail dot com>
pyname='Scrapy'
pkgname='python-scrapy'
pkgver='1.1.0'
pkgrel=1
pkgdesc='An open source framework for extracting the data you need from websites'
arch=('any')
url='http://scrapy.org/'
license=('BSD')
depends=('python' 'python-pydispatcher' 'python-lxml' 'python-twisted' 'python-cssselect' 'python-parsel' 'python-pyopenssl' 'python-queuelib' 'python-six' 'python-w3lib' 'python-service-identity')
makedepends=('python-pip')
conflicts=('python2-scrapy')
source=('https://pypi.python.org/packages/f7/9f/237e96ffa1258f3cc8b45672fc0705e87b04c52d438737eb107510034c0a/Scrapy-1.1.0.tar.gz')
md5sums=('48d3fd6f4594d26f6fc3bcd01f3dcc20')


package() {
    cd "${srcdir}/${pyname}-${pkgver}"
    echo :: Installing scrapy ...
    pip3 install --prefix=/usr --isolated --root="${pkgdir}" --no-deps --ignore-installed .
}
