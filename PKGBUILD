# Maintainer: Michael Hansen <zrax0111 gmail com>

pkgname=kf5-doc-qch
pkgver=2020.09.09
pkgrel=1
conflicts=('frameworks5-doc-qch')
replaces=('frameworks5-doc-qch')
pkgdesc="Reference for developing with the KDE frameworks in Qt Help format"
arch=('any')
url='http://api.kde.org/'
license=('FDL')

pkgver() {
    date "+%Y.%m.%d"
}

source=("frameworks5-frameworks-$(pkgver).qch::http://api.kde.org/qch/frameworks5-frameworks.qch")
sha1sums=('SKIP')

package() {
    install -d -m755 "$pkgdir/usr/share/doc/qt"
    install -m644 "$srcdir/frameworks5-frameworks-$pkgver.qch" \
                  "$pkgdir/usr/share/doc/qt/"
}
