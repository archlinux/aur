# Maintainer: Johannes Wienke <languitar@semipol.de>

pkgname=bibfix
pkgver=0.2
pkgrel=2
pkgdesc="Fixes unescaped acronyms in titles in bibtex files"
arch=(any)
url="https://github.com/languitar/bibfix"
license=('LGPL3')
depends=('python3' 'python-bibtexparser')
makedepends=('git' 'python-setuptools')
source=("https://github.com/languitar/bibfix/archive/release-${pkgver}.tar.gz")
md5sums=('77895250267e86b00cf7b82f939109f7')

package() {
    cd "bibfix-release-${pkgver}"
    python3 setup.py install --root="$pkgdir/"
}
