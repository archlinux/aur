# Maintainer: Pieter Goetschalckx <3.14.e.ter at gmail dot com>
# Contributor: Stijn Seghers (Procrat) <stijnseghers at gmail dot com>

pkgname=pylava
pkgver=0.2.2
pkgrel=1
pkgdesc="Code audit tool for python, community-driven fork of pylama"
arch=('any')
url="https://github.com/pyfocus/pylava"
license=('GPL3')
depends=('python-pycodestyle>=2.3.1' 'python-pydocstyle>=2.0.0' 'python-pyflakes>=1.5.0' 'python-mccabe>=0.5.2')
optdepends=('pylava_pylint: pylint support'
            'python-radon: radon support')
source=("https://github.com/pyfocus/pylava/archive/$pkgver.tar.gz")
sha256sums=('78e68e4f247af31e3efcf7637c733683d9d54ec82f963ec475209584c77d274b')

package() {
  cd "$pkgname-$pkgver"

  python setup.py install --root="$pkgdir/" --optimize=1
}
