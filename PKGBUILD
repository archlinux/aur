# Maintainer: Benjamin Winger <bmw@disroot.org>

pkgname=python-python-sat
pkgver=0.1.5.dev14
pkgrel=1
pkgdesc="A Python library for prototyping with SAT oracles"
provides=('python-python-sat')
conflicts=('python-python-sat')
arch=(any)
url="https://github.com/pysathq/pysat"
license=(GPL3)
depends=("python" "python-six")
source=("https://files.pythonhosted.org/packages/ed/1a/27cee1f39ee78563ea8944a2c63d7098be87349c52e8e3997b11fe6f428a/python-sat-0.1.5.dev14.tar.gz")
sha512sums=('1e878d4d2669e4ae25184bb47ccb12507e870279ff2ea5d03a6e67b2a42649c941b9963591c92748f95602c44e46226a4cb746b987a2d97d450298f60c8d294b')

package() {
  cd "$srcdir/python-sat-$pkgver"
  python setup.py install --root $pkgdir
}
