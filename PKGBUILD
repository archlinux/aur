# Maintainer: Chris Oelmueller <chris.oelmueller@gmail.com>

pkgname=python-typed-ast
pkgver=1.0.0
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

md5sums=('c0bd77e8ad703973f553c5330abdceca')
sha256sums=('2a5b738efcfbd0da5bd87ce998a31810c58a66a933f554c074fa96ec5f10a1cc')
