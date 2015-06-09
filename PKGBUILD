# Maintainer: Thomas Weißschuh <thomas t-8ch.de>

pkgname=bandit
pkgver=0.11.0
pkgrel=1
pkgdesc='Python security linter from OpenStack Security'
arch=('any')
url='https://wiki.openstack.org/wiki/Security/Projects/Bandit'
license=('Apache')
depends=('python2-yaml')
source=("https://pypi.python.org/packages/source/b/bandit/bandit-${pkgver}.tar.gz")


build() {
    cd "$srcdir/bandit-$pkgver"
    python2 setup.py build
}

package() {
    cd "$srcdir/bandit-$pkgver"
    python2 setup.py install --root="$pkgdir" --optimize=1
}

sha256sums=('d8eb980ae06fc398236b00854d999ea74bd6fca4561f87f16b11eb2be25dd757')
