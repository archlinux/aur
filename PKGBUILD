# Maintainer: Johannes Wienke <languitar@semipol.de>

pkgname=bibfix
pkgver=0.1.1
pkgrel=1
pkgdesc="Fixes unescaped acronyms in titles in bibtex files"
arch=(any)
url="https://github.com/languitar/bibfix"
license=('LGPL3')
depends=('python3' 'python-bibtexparser')
makedepends=('git' 'python-setuptools')
source=("https://github.com/languitar/bibfix/archive/release-${pkgver}.tar.gz")
md5sums=('452c49a15fec5dcc1a3dd7e644f5716b')

package() {
    cd "bibfix-release-${pkgver}"
    python3 setup.py install --root="$pkgdir/"
}
