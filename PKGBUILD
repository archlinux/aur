# Maintainer: Chris Oelmueller <chris.oelmueller@gmail.com>

pkgname=python-typed-ast
pkgver=1.0.3
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

md5sums=('fd8e49d798dab5de30b03fcf4a97c30d')
sha256sums=('67184179697ea9128fa8fec1d3b4e26b41d6a2eceab4674c6e3da4b024309862')
