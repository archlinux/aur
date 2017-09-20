# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: "riverrun <alovedalongthe AT gmail DOT com>"

_name=genxword
pkgname=${_name}3
pkgver=1.2.0
pkgrel=1
pkgdesc="Crossword generator (Python 3 version)"
arch=('any')
url="https://pypi.python.org/pypi/genxword"
license=("GPLv3")
depends=("python" "python-cairo" "python-gobject" "gtksourceview3" "pango")
makedepends=("python-setuptools")
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
md5sums=('bc985c9e99cb6e8c86ea3a72f396b388')


package() {
    cd "$srcdir/genxword-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}
