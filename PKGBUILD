# Maintainer: robertfoster
# Contributor: Ista Zahn <istazahn[at]gmail[dot]com>

pkgbase=python-pyppeteer
_pyname=pyppeteer
pkgname=('python-pyppeteer')
depends=('python' 'python-pyee' 'python-tqdm' 'python-websockets')
makedepends=('python-setuptools')
pkgver=0.0.25
pkgrel=1
pkgdesc="Headless chrome/chromium automation library"
arch=('any')
url="https://github.com/miyakogi/pyppeteer"
license=('MIT')
source=("${_pyname}-${pkgver}.tar.gz::https://github.com/miyakogi/${_pyname}/archive/${pkgver}.tar.gz")

package() {
	cd "${srcdir}/${_pyname}-${pkgver}"
	python setup.py install -O1 --root="${pkgdir}"
	install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm 644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README"

}

md5sums=('cc42fe229c18e45bd73ac50b73bebdf8')
