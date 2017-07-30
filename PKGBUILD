# Maintainer: Stanisław Pitucha <viraptor@gmail.com>
pkgname=python-ofxparse
pkgver=0.16
pkgrel=1
pkgdesc="Tools for working with the OFX (Open Financial Exchange) file format"
arch=('any')
url="http://sites.google.com/site/ofxparse"
license=('MIT')
depends=('python' 'python-beautifulsoup4' 'python-six')
makedepends=('python-setuptools')
source=(${pkgname}::"https://pypi.python.org/packages/7e/76/eb1a55f44d266cc87d094f2eee5349f412c2034f1c844722b2d2be3614c4/ofxparse-${pkgver}.tar.gz")
sha256sums=('cca83cd3d5578e7003b53457522c6dbb27832b734dbf869adf585f1547c3a91e')


package() {
	cd "${srcdir}/ofxparse-${pkgver}"
	python setup.py install --root="${pkgdir}/" --optimize=1
}
