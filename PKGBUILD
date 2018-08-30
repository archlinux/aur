# Maintainer: Pieter Goetschalckx <3.14.e.ter at gmail dot com>
# Contributor: Stijn Seghers (Procrat) <stijnseghers at gmail dot com>

pkgname=pylava
pkgver=0.2.1
pkgrel=1
pkgdesc="Code audit tool for python, community-driven fork of pylama"
arch=('any')
url="https://github.com/pyfocus/pylava"
license=('GPL3')
depends=('python-pycodestyle>=2.3.1' 'python-pydocstyle>=2.0.0' 'python-pyflakes>=1.5.0' 'python-mccabe>=0.5.2')
optdepends=('pylava_pylint: pylint support'
            'python-radon: radon support')
source=("https://github.com/pyfocus/pylava/archive/$pkgver.tar.gz")
sha256sums=('b899739c044abb1ca03032241f09cb996ba45740d5b0fcad90def3cb6d19620e')

package() {
  cd "$pkgname-$pkgver"

  python setup.py install --root="$pkgdir/" --optimize=1
}
