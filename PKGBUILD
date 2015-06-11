# Maintainer: Ivan Cai <caizixian@users.noreply.github.com>
pkgname=python-iptables 
pkgver=0.7.0
pkgrel=1
pkgdesc="Python bindings for iptables"
arch=('x86_64' 'i686')
url="https://github.com/ldx/python-iptables"
license=('Apache')
groups=()
depends=('python')
makedepends=('python-setuptools')
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/p/python-iptables/python-iptables-0.7.0.tar.gz")
md5sums=('e1ee97f15f1c7e2a8545ff7e0213c714')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

