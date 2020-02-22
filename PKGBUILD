# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: "riverrun <alovedalongthe AT gmail DOT com>"

_name=genxword
pkgname=${_name}3
pkgver=2.0.1
pkgrel=1
pkgdesc="Crossword generator (Python 3 version)"
arch=('any')
url="https://pypi.python.org/pypi/genxword"
license=("GPLv3")
depends=("python" "python-cairo" "python-gobject" "gtksourceview3" "pango")
makedepends=("python-setuptools")
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")

package() {
    cd "$srcdir/genxword-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}
sha256sums=('d9d9982a4f35caa1ca03d2ec44688cff9cf48d615ae5f5344d743c4d1866972f')
