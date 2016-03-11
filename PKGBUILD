# Maintainer: Edison Ibañez <edison@openmailbox.org>

pkgname=python2-rows
_pkgname=rows
pkgver=0.1.1
pkgrel=1
pkgdesc="A common, beautiful interface to tabular data, no matter the format"
arch=('any')
depends=('python2' 'python2-unicodecsv' 'python2-click' 'python2-requests' 'python2-lxml' 'python2-xlrd' 'python2-xlwt' 'python2-openpyxl')
makedepends=('mercurial')
license=('GPLv3')
url="https://github.com/turicas/rows"

source=("https://github.com/turicas/${_pkgname}/archive/v${pkgver}.tar.gz")

package() {
    cd $srcdir/$_pkgname-$pkgver
    python2 setup.py build
    python2 setup.py install --prefix=/usr --root "${pkgdir}" || return 1
}
md5sums=('a1bc82f02bda5a1f33139d11b1ecdac8')
