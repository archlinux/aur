# Maintainer: Michał Pałubicki <maln0ir@gmx.com>

_pkgname=grako
pkgname=python-$_pkgname
pkgver=3.99.9
pkgrel=1
pkgdesc="Grako (for grammar compiler) is a tool that takes grammars in a variation of EBNF as input, and outputs memoizing (Packrat) PEG parsers in Python."
arch=("any")
url="https://bitbucket.org/neogeny/grako"
license=("Custom")
depends=("python"
         "cython"
         "python-colorama"
         "python-docutils"
         "flake8"
         "python-prospector"
         "python-pygraphviz"
         "python-pytest"
         "python-regex"
         "python-tox"
         "python-twine")
makedepends=("python-setuptools")
source=("https://bitbucket.org/neogeny/grako/get/${pkgver}.tar.bz2")
sha256sums=('82cc8d601a272106ed3bbc09f37b04b85f21cbe4c8bbebb41bb9d57ac419696f')

package() {
    cd "$srcdir/neogeny-grako-275d3c4fe4ac"
    python setup.py install --root="$pkgdir/" --optimize=1
}
