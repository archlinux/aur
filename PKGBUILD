# Maintainer: Benjamin Winger <bmw@disroot.org>

pkgname=python-python-sat
pkgver=0.1.6.dev3
pkgrel=1
pkgdesc="A Python library for prototyping with SAT oracles"
provides=('python-python-sat')
conflicts=('python-python-sat')
arch=(any)
url="https://github.com/pysathq/pysat"
license=(GPL3)
depends=("python" "python-six")
source=("https://files.pythonhosted.org/packages/e5/0c/9a4832d6c39e31d87508cb41e2bff534820e3a5dc779f660c1ac38521a49/python-sat-0.1.6.dev3.tar.gz")
sha512sums=('c517f8d2d1cd808ab32b774e80a25355b71afe045fb20f69ef39358f81154d41e80ecdb079d8441642ccf58ae7473d1c11aa37f90920db2cd0dd328ce642dc7e')

package() {
  cd "$srcdir/python-sat-$pkgver"
  python setup.py install --root $pkgdir
}
