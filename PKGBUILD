# Maintainer: Joshua Ward <joshuaward at myoffice dot net dot au>
# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: "riverrun <alovedalongthe AT gmail DOT com>"

_name=genxword
pkgname=${_name}3
pkgver=2.1.0
pkgrel=2
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
sha256sums=('979047b643855959125bbae90b290a572296008517feb5cbd4e46d09e52b69ea')
