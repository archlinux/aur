# Maintainer: S.Leduc <sebastien@sleduc.fr>
pkgname=pyrepl
pkgver=0.9.0
pkgrel=1
pkgdesc="A Python library for building flexible command line interfaces"
url="https://github.com/pypy/pyrepl"
arch=("any")
license=('MIT')
depends=('python2')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('7c6e6d9df46b8687c8a4106b26a5cd85')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
