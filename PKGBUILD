# Maintainer: wenLiangcan <boxeed at gmail dot com>

pkgname=x_x
pkgver=0.9
pkgrel=1
pkgdesc="Excel file CLI Reader"
url="http://github.com/krockode/x_x"
depends=('python-six'
         'python-click'
         'python-xlrd')
makedepends=('python-setuptools')
license=('Apache 2.0')
arch=('any')
source=("https://pypi.python.org/packages/source/x/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('fa0c660f4ce00a4501ee1845e339fb7f')

package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    python setup.py install --root="$pkgdir" --optimize=1
}
