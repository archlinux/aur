# Maintainer: Sebastien LEDUC <sebastien@sleduc.fr>
# Contributor: Gilles CHAUVIN <gcnweb at gmail dot com>

pkgname=python-netaddr
pkgver=0.7.15
pkgrel=1
pkgdesc="A pure Python network address representation and manipulation library"
arch=('any')
license=('BSD')
url="http://github.com/drkjam/netaddr/"
depends=('python')
optdepends=('ipython: used to work with the netaddr interractive command')
source=("https://pypi.python.org/packages/source/n/netaddr/netaddr-${pkgver}.tar.gz")
md5sums=('bd024c8f82f71fd1d90553da64735f14')

package() {
    cd "$srcdir/netaddr-$pkgver/"
    python setup.py install --root="$pkgdir/" --optimize=1
}

