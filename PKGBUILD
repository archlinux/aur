# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=python-moto
_pkgname=moto
pkgver=1.1.25
pkgrel=1
pkgdesc="Moto is a library to mock out the boto library."
arch=('any')
url="https://github.com/spulec/moto"
license=('Apache')
depends=('python' 'python-boto3' 'python-cookies' 'python-requests' 'python-xmltodict' 'python-dicttoxml' 
'python-werkzeug' 'python-dateutil')
checkdepends=('python-freezegun' 'python-nose' 'python-sure')
optdepends=('python-boto')
makedepends=('python-setuptools')
source=("https://github.com/spulec/moto/archive/$pkgver.tar.gz")
sha256sums=('39e3d38756746132296bc6abf36061bbc2d3d9babe98bd5d4ffc0653f4838117')

package(){
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

#check(){
#  cd "$srcdir/$_pkgname-$pkgver"
#  nosetests tests/
#}
# vim:ts=2:sw=2:et:
