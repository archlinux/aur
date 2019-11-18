# Maintainer: Dennis Fink <dennis.fink@c3l.lu>

pkgname=patternutils
pkgver=0.0.7
pkgrel=1
pkgdesc="Combine regular expressions with template engines in a powerful matter."
arch=('any')
url="https://projects.metalgamer.eu/patternutils"
license=('GPL3')
depends=('python' 'python-click' 'python-jinja' 'python-pygments')
source=('patternutils-0.0.7.zip::https://projects.metalgamer.eu/patternutils/archive/63e2ad2d42116041db43b33f5ad0aafe84ec38ad.zip?subrepos=false')
sha512sums=('efbae7ecd8eb17564db574fa4a8bc573ce0203fb7b6130ad118d695f3ba4cd4b1f66c2fd469a8c3003e7538467ee4d54a7b30d02dd3f28afe12b4c012e52a9bc')

build() {
    cd "$srcdir/$pkgname-63e2ad2d4211"
    python setup.py build
}

package() {
    cd "$srcdir/$pkgname-63e2ad2d4211"
    python setup.py install --root="$pkgdir" --optimize=1
}
