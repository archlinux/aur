# Maintainer: Chris Oelmueller <chris.oelmueller@gmail.com>

pkgname=python-typed-ast
pkgver=1.0.4
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

md5sums=('7a9670f9e3b177872bc611a366b87e6d')
sha256sums=('73f09aac0119f6664a3f471a1ec1c9b719f572bc9212913cea96a78b22c2e96e')
