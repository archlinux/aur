# Maintainer: Thomas Haider <t.haider@deprecate.de>
pkgname=python2-publicsuffix
pkgver=1.0.5
pkgrel=2
pkgdesc="Get a public suffix for a domain name using the Public Suffix List."
arch=('any')
url="https://pypi.python.org/pypi/publicsuffix"
license=('MIT')
depends=('python2')
source=("https://pypi.python.org/packages/source/p/publicsuffix/publicsuffix-${pkgver}.tar.gz")
 
build() {
  cd "publicsuffix-${pkgver}"
  python2 setup.py build 
}

package() {
  cd "publicsuffix-${pkgver}"
  python2 setup.py install --root=$pkgdir --optimize=1
}

sha256sums=('7ad1bcd781909e99aa125e446141c89875038be9dd7734dd4dae4fd8f9389c66')
