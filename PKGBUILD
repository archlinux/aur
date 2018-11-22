# Maintainer: Pieter Goetschalckx <3.14.e.ter at gmail dot com>
# Contributor: Stijn Seghers (Procrat) <stijnseghers at gmail dot com>

pkgname=pylama
pkgver=7.6.6
pkgrel=1
pkgdesc="Code audit tool for python"
arch=('any')
url="https://github.com/klen/pylama"
license=('GPL3')
depends=('python-pycodestyle>=2.3.1' 'python-pydocstyle>=2.0.0' 'python-pyflakes>=1.5.0' 'python-mccabe>=0.5.2')
optdepends=('pylama_pylint: pylint support'
            'python-radon: radon support')
source=("https://github.com/klen/pylama/archive/$pkgver.tar.gz")
sha256sums=('e56060c68ab89cc746e10aa357168decbdb187e0d4714a9f5c670ee1e6413c4e')

package() {
  cd "$pkgname-$pkgver"

  python setup.py install --root="$pkgdir/" --optimize=1
}
