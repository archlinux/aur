# Maintainer: Dennis Fink <dennis.fink@c3l.lu>

pkgname=patternutils
pkgver=0.0.6
pkgrel=1
pkgdesc="Combine regular expressions with template engines in a powerful matter."
arch=('any')
url="https://projects.metalgamer.eu/patternutils"
license=('GPL3')
depends=('python' 'python-click' 'python-jinja' 'python-pygments')
source=('patternutils-0.0.6.zip::https://projects.metalgamer.eu/patternutils/archive/197b847bbf5304f568c7a7b36af002df601367c7.zip?subrepos=false')
sha512sums=('683bd060390e8654519bf5bc61876164a87fcea06c7c98a5ac9a8c1cda6c20548e0fd23936c4973ec36e1d50f3227f030b3299aafd5af710196c81f2258a21e1')

build() {
    cd "$srcdir/$pkgname-197b847bbf53"
    python setup.py build
}

package() {
    cd "$srcdir/$pkgname-197b847bbf53"
    python setup.py install --root="$pkgdir" --optimize=1
}
