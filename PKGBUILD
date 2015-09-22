#Maintainer: "riverrun <alovedalongthe AT gmail DOT com>"

pkgname=genxword3
pkgver=1.0.9
pkgrel=1
pkgdesc="Crossword generator (Python 3 version)"
arch=('any')
url="https://pypi.python.org/pypi/genxword/${pkgver}"
license=("GPLv3")
depends=("python" "python-cairo" "python-gobject" "gtksourceview3")
makedepends=("python-setuptools")
source=("https://pypi.python.org/packages/source/g/genxword/genxword-${pkgver}.tar.gz")

md5sums=('24c140597a969b8ffb78be3c4ecf2df6')


package() {
    cd "$srcdir/genxword-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}
