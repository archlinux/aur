# Maintainer: GI_Jack <GI_Jack@hackermail.com>
pkgname=python2-wappalyzer
_pypiname=python-Wappalyzer
pkgver=0.2.2
pkgrel=1
pkgdesc="Python driver for Wappalyzer, a web application detection utility."
arch=('any')
url="https://github.com/chorsley/python-Wappalyzer"
license=('GPLv3')
depends=('python2' 'python2-beautifulsoup4' 'python2-requests' 'python2-nose' 'python2-httpretty')
makedepends=('python2-setuptools')
source=("https://files.pythonhosted.org/packages/34/30/1d686c4de1f3b67286d187488c404afa77fdb14e26f60a9ca5c890c74f05/python-Wappalyzer-${pkgver}.tar.gz")
sha256sums=('c09522543b6a76a01bceafed94d465f94a9c2460749b7471544f977c1f697a89')

package() {
  cd "${_pypiname}-${pkgver}"
  python2 setup.py install -O1 --root="${pkgdir}" --prefix=/usr
}
