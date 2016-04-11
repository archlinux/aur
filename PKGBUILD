# Maintainer: Stanisław Pitucha <viraptor@gmail.com>
pkgname=python-ofxparse
pkgver=0.14
pkgrel=1
pkgdesc="Tools for working with the OFX (Open Financial Exchange) file format"
arch=('any')
url="http://sites.google.com/site/ofxparse"
license=('MIT')
depends=('python' 'python-beautifulsoup4' 'python-six')
source=(${pkgname}::"https://pypi.python.org/packages/source/o/ofxparse/ofxparse-${pkgver}.tar.gz")
sha256sums=('d8c486126a94d912442d040121db44fbc4a646ea70fa935df33b5b4dbfbbe42a')


package() {
	cd "${srcdir}/ofxparse-${pkgver}"
	python setup.py install --root="${pkgdir}/" --optimize=1
}
