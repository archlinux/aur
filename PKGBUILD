# Maintainer: Pieter Goetschalckx <3.14.e.ter at gmail dot com>
# Contributor: Stijn Seghers (Procrat) <stijnseghers at gmail dot com>

pkgname=pylama
pkgver=7.4.3
pkgrel=2
pkgdesc="Code audit tool for python"
arch=('any')
url="https://github.com/klen/pylama"
license=('GPL3')
depends=('python-pycodestyle>=2.3.1' 'python-pydocstyle>=2.0.0' 'python-pyflakes>=1.5.0' 'python-mccabe>=0.5.2')
optdepends=('pylama_pylint: pylint support'
            'python-radon: radon support')
source=("https://github.com/klen/pylama/archive/$pkgver.tar.gz")
sha256sums=('ec9a1bcf4c270e8cfeb1bce3c7f813465b8eb7baf88283df7ec8efa05463dda8')

package() {
  cd "$pkgname-$pkgver"

  python setup.py install --root="$pkgdir/" --optimize=1
}
