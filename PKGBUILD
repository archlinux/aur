# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=python-moto
_pkgname=moto
pkgver=1.0.1
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
sha256sums=('1288e8800dd9365748cc7af6cee7d62d28eec3fd525ab524cdf3ffd34d7dc150')

package(){
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

#check(){
#  cd "$srcdir/$_pkgname-$pkgver"
#  nosetests tests/
#}
# vim:ts=2:sw=2:et:
