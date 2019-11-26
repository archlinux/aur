# Maintainer: Michael Borders <michael.a.borders@gmail.com>

pkgname=python-junos-eznc
_pkgname=py-junos-eznc
pkgver=2.3.0
pkgrel=2
pkgdesc="Python library for Junos automation"
arch=('any')
url="https://github.com/Juniper/py-junos-eznc"
license=('Apache')
depends=('python' 'python-lxml' 'python-ncclient' 'python-paramiko' 'python-scp' 'python-jinja' 'python-pyaml' 'python-netaddr' 'python-six' 'python-pyserial' 'python-yamlordereddictloader' 'python-pyparsing' 'python-transitions')
makedepends=('python-setuptools')
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('32d99a949778ad3bd0ca378db826749423a6bb0f964f39a7e4bb337452c6b5f0')

package(){
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
