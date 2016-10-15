# Maintainer: Chris Oelmueller <chris.oelmueller@gmail.com>

pkgname=python-typed-ast
pkgver=0.6.1
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

md5sums=('27577d8f436ea6a36715d412092baac4')
sha256sums=('f3381db04d74676a803769173dbaac3d7ef7b8c66866f43ae19688672d86d633')
