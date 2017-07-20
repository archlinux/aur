# Maintainer: Chris Oelmueller <chris.oelmueller@gmail.com>

pkgname=python-typed-ast
pkgver=1.1.0
_pythonname="typed-ast"
_foldername="${_pythonname}-${pkgver}"
pkgrel=1
arch=('any')
url='https://github.com/dropbox/typed_ast'
license=('Apache')
pkgdesc='Fork of Python 2 and 3 ast (Abstract Syntax Trees) modules with type comment support'
depends=('python')
source=("https://pypi.io/packages/source/t/${_pythonname}/${_pythonname}-${pkgver}.tar.gz")

package() {
  cd "$srcdir/${_foldername}"

  python setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1
}

sha1sums=('f9af98899e39661a44296e2ced8de9c5f5187fde')
sha256sums=('57fe287f0cdd9ceaf69e7b71a2e94a24b5d268b35df251a88fef5cc241bf73aa')
