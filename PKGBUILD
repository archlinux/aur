pkgname=python-junos-eznc
_pkgname=py-junos-eznc
pkgver=2.4.1
pkgrel=1
pkgdesc="Python library for Junos automation"
arch=('any')
url="https://github.com/Juniper/py-junos-eznc"
license=('Apache')
depends=('python' 'python-lxml' 'python-ncclient' 'python-paramiko' 'python-scp' 'python-jinja' 'python-pyaml' 'python-netaddr' 'python-six' 'python-pyserial' 'python-yamlordereddictloader' 'python-pyparsing' 'python-transitions')
makedepends=('python-setuptools')
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('843020e14d53c68dbbc331bcbcc1ed5c8248a1258f5475ddc6bfadbb5152224b')

package(){
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
