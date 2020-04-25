# Maintainer: Michael Borders <dev@michaelborders.net>

pkgname=python-junos-eznc
_pkgname=py-junos-eznc
pkgver=2.3.1
pkgrel=1
pkgdesc="Python library for Junos automation"
arch=('any')
url="https://github.com/Juniper/py-junos-eznc"
license=('Apache')
depends=('python' 'python-lxml' 'python-ncclient' 'python-paramiko' 'python-scp' 'python-jinja' 'python-pyaml' 'python-netaddr' 'python-six' 'python-pyserial' 'python-yamlordereddictloader' 'python-pyparsing' 'python-transitions')
makedepends=('python-setuptools')
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('f3efbd1226fb5066ea53c3de316664f17a0f7c9dd88915507ea8b828c2810de7')

package(){
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
