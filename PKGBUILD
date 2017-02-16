# Maintainer: Chris Oelmueller <chris.oelmueller@gmail.com>

pkgname=python-typed-ast-0.6.x
pkgver=0.6.3
_pythonname="typed-ast"
_foldername="${_pythonname}-${pkgver}"
pkgrel=2
arch=('any')
url='https://github.com/python/typed_ast'
license=('Apache')
pkgdesc='a fork of Python 2 and 3 ast modules with type comment support (0.6.x version, for use with mypy)'
depends=('python')
conflicts=('python-typed-ast')
source=("https://pypi.org/packages/source/t/${_pythonname}/${_pythonname}-${pkgver}.tar.gz")

package() {
    cd "$srcdir/${_foldername}"
    python setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1
}

sha256sums=('d41a1856c882a51e398ad9972c9a7964b2f5e210317088382a419b5183544a29')
