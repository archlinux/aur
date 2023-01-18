# Maintainer: Benjamin Winger <bmw@disroot.org>

pkgname=python-python-sat
pkgver=0.1.7.dev25
pkgrel=1
pkgdesc="A Python library for prototyping with SAT oracles"
provides=('python-python-sat')
conflicts=('python-python-sat')
arch=(any)
url="https://github.com/pysathq/pysat"
license=(GPL3)
depends=("python" "python-six")
source=("https://files.pythonhosted.org/packages/61/1f/2569aff31ab18217ef4fe0301f1de2902fcbbf78a1bdbbc3397d00b99b3e/python-sat-0.1.7.dev25.tar.gz")
sha512sums=('361e94178eec5354432c9127d708251f5214746a3d049815a02923e5c5de2b69f81969ad9d981d36a6dfb6693882c6c862cf958faf781b4f74b112564829475c')

package() {
  cd "$srcdir/python-sat-$pkgver"
  python setup.py install --root $pkgdir
}
