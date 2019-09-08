# Maintainer: robertfoster
# Contributor: Ista Zahn <istazahn[at]gmail[dot]com>

pkgbase=python-requests-html
_pyname=requests-html
pkgname=('python-requests-html')
depends=('python' 'python-requests' 'python-pyquery' 'python-fake-useragent' 
'python-parse' 'python-beautifulsoup4' 'python-w3lib' 'python-pyppeteer')
makedepends=('python-setuptools')
pkgver=0.10.0
pkgrel=1
pkgdesc="HTML Parsing for Humans"
arch=('any')
url="http://html.python-requests.org/"
license=('MIT')
source=("${_pyname}-${pkgver}.tar.gz::https://github.com/kennethreitz/${_pyname}/archive/v${pkgver}.tar.gz")

package() {
  cd "${srcdir}/${_pyname}-${pkgver}"
  python setup.py install -O1 --root="${pkgdir}"
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README"
}

md5sums=('1f7c9979d12e76da98e53cfb0b63027e')
