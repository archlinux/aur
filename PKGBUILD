pkgname=('python-sphinx-renku-theme')
pkgver=0.2.2
pkgrel=1
pkgdesc='Sphinx theme for Renku documentation'
arch=('any')
url='https://github.com/SwissDataScienceCenter/renku-sphinx-theme'
license=('Apache')
makedepends=('python-setuptools')
source=("https://github.com/SwissDataScienceCenter/renku-sphinx-theme/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('a02e96e4b15fb3100d5d0d549795c47e35c66219a6279723848212fe2a206e3b')

build() {
  cd $srcdir/renku-sphinx-theme-$pkgver
  python setup.py build
}

package() {
  cd renku-sphinx-theme-$pkgver
  python setup.py install --root $pkgdir --optimize=1
}
