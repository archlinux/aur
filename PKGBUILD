# Maintainer: James An <james@jamesan.ca>

pkgname=python-bencodepy
_pkgname=BencodePy
pkgver=0.9.5.r5.ga9c145b
pkgrel=1
pkgdesc='A small Python 3 library for encoding and decoding Bencode data'
arch=('any')
url="https://github.com/eweast/$_pkgname"
license=('GPL')
depends=('python')
makedepends=('python-setuptools')
source=("https://github.com/eweast/$_pkgname/archive/master.zip")
md5sums=('d04fb70c690bd5025e1c6444f37797b8')

package() {
    cd "$_pkgname-master"
    python setup.py install --root="$pkgdir" --optimize=1
}
