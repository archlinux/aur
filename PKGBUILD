# Maintainer: Aaron DeVore <aaron.devore@gmail.com>
# Contributor: tocer <tocer.deng@gmail.com>

pkgname=python-fudge
pkgver=1.1.1
pkgrel=2
pkgdesc="Use fake objects (mocks, stubs, etc) to test real ones"
arch=(any)
url="http://farmdev.com/projects/fudge/"
license=(MIT)
depends=('python')
makedepends=('python-setuptools')
optdepends=('python-fudge-docs: documentation for Fudge')
source=("https://files.pythonhosted.org/packages/source/f/fudge/fudge-${pkgver}.tar.gz")
md5sums=('3aefdd12c3e0518665fe6735b24a0f9b')

package() {
  cd "$srcdir/fudge-$pkgver"
  python setup.py install --root=$pkgdir/ --optimize=1
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
