pkgbase=python2-j2cli
pkgname=(python2-j2cli)
pkgver=0.3.1
pkgrel=0
pkgdesc="Command-line interface to Jinja2 for templating in shell scripts."
url="https://github.com/kolypto/j2cli"
license=("BSD")
arch=('any')
makedepends=('python' 'python2' 'python-setuptools' 'python2-setuptools')
source=("$pkgbase-$pkgver.tar.gz::https://pypi.python.org/packages/source/j/j2cli/j2cli-$pkgver-0.tar.gz")
md5sums=('bbe68bb0cb8e6b3feab7583e3baff7b0')

package_python-j2cli() {
  depends=('python')

  cd $srcdir/j2cli-${pkgver}-${pkgrel}
  python setup.py install --root=$pkgdir
  install -D -m0644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

package_python2-j2cli() {
  depends=('python2')

  cd $srcdir/j2cli-${pkgver}-${pkgrel}
  python2 setup.py install --root=$pkgdir
  install -D -m0644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

