# Maintainer: Francois Boulogne <fboulogne at april dot org>
# Contributor: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

_realname=sigtools
pkgname=python-sigtools
pkgver=2.0.1
pkgrel=1
pkgdesc="Joblties for working with 3.3's inspect.Signature objects.ib is a set of tools to provide lightweight pipelining in Python."
url="https://pypi.python.org/pypi/sigtools"
arch=(any)
license=('MIT')
depends=('python' 'python-funcsigs')
makedepends=('python-setuptools')
source=("https://pypi.python.org/packages/0e/bc/29248bd3ad5cc14dffa7ce6d26878c186766eb7febebc2720cbbe9a13a60/$_realname-$pkgver.tar.gz")
md5sums=('f67b9d4d1e670c2f594c50ac50303652')

package() {
    cd "$srcdir/$_realname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}
