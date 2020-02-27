pkgname=pyneedle
pkgnameorig=pyneedle
pkgver=86
pkgrel=3
pkgdesc="Convenient tool created to allow you to quickly search for files in your computer, using one of the supported search engines (i.e. tracker and recoll)"
arch=('any')
url="https://github.com/alejandro-perez/pyneedle"
license=('MIT')
depends=('gtk3' 'python-setuptools')
optdepends=('recoll' 'tracker')
options=(!emptydirs)
makedepends=('git')
source=('git+https://github.com/alejandro-perez/pyneedle.git')
md5sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"
  python3 setup.py build
}

package() {
  cd "$srcdir/$pkgname"
  python3 setup.py install --prefix=/usr --root="$pkgdir"
}

# vim:set ts=2 sw=2 et:
